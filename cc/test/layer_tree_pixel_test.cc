// Copyright 2013 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "cc/test/layer_tree_pixel_test.h"

#include "base/path_service.h"
#include "cc/output/copy_output_request.h"
#include "cc/output/copy_output_result.h"
#include "cc/resources/texture_mailbox.h"
#include "cc/test/paths.h"
#include "cc/test/pixel_comparator.h"
#include "cc/test/pixel_test_output_surface.h"
#include "cc/test/pixel_test_software_output_device.h"
#include "cc/test/pixel_test_utils.h"
#include "cc/trees/layer_tree_impl.h"
#include "ui/gl/gl_implementation.h"
#include "webkit/common/gpu/context_provider_in_process.h"
#include "webkit/common/gpu/webgraphicscontext3d_in_process_command_buffer_impl.h"

namespace cc {

LayerTreePixelTest::LayerTreePixelTest()
    : pixel_comparator_(new ExactPixelComparator(true)), use_gl_(true) {}

LayerTreePixelTest::~LayerTreePixelTest() {}

scoped_ptr<OutputSurface> LayerTreePixelTest::CreateOutputSurface() {
  gfx::Vector2d viewport_offset(20, 10);
  gfx::Size surface_expansion_size(40, 60);
  scoped_ptr<PixelTestOutputSurface> output_surface;

  if (!use_gl_) {
    scoped_ptr<PixelTestSoftwareOutputDevice> software_output_device(
        new PixelTestSoftwareOutputDevice);
    software_output_device->set_surface_expansion_size(surface_expansion_size);
    output_surface = make_scoped_ptr(
        new PixelTestOutputSurface(
            software_output_device.PassAs<SoftwareOutputDevice>()));
  } else {
    CHECK(gfx::InitializeGLBindings(gfx::kGLImplementationOSMesaGL));

    using WebKit::WebGraphicsContext3D;
    using webkit::gpu::WebGraphicsContext3DInProcessCommandBufferImpl;
    scoped_ptr<WebGraphicsContext3DInProcessCommandBufferImpl> context3d(
        WebGraphicsContext3DInProcessCommandBufferImpl::CreateOffscreenContext(
            WebGraphicsContext3D::Attributes()));
    output_surface = make_scoped_ptr(
        new PixelTestOutputSurface(context3d.PassAs<WebGraphicsContext3D>()));
  }

  output_surface->set_viewport_offset(viewport_offset);
  output_surface->set_surface_expansion_size(surface_expansion_size);
  return output_surface.PassAs<OutputSurface>();
}

scoped_refptr<cc::ContextProvider>
LayerTreePixelTest::OffscreenContextProviderForMainThread() {
  scoped_refptr<webkit::gpu::ContextProviderInProcess> provider =
      webkit::gpu::ContextProviderInProcess::Create();
  CHECK(provider->BindToCurrentThread());
  return provider;
}

scoped_refptr<cc::ContextProvider>
LayerTreePixelTest::OffscreenContextProviderForCompositorThread() {
  scoped_refptr<webkit::gpu::ContextProviderInProcess> provider =
      webkit::gpu::ContextProviderInProcess::Create();
  CHECK(provider.get());
  return provider;
}

scoped_ptr<CopyOutputRequest> LayerTreePixelTest::CreateCopyOutputRequest() {
  return CopyOutputRequest::CreateBitmapRequest(
      base::Bind(&LayerTreePixelTest::ReadbackResult, base::Unretained(this)));
}

void LayerTreePixelTest::ReadbackResult(scoped_ptr<CopyOutputResult> result) {
  ASSERT_TRUE(result->HasBitmap());
  result_bitmap_ = result->TakeBitmap().Pass();
  EndTest();
}

void LayerTreePixelTest::BeginTest() {
  Layer* target = readback_target_ ? readback_target_
                                   : layer_tree_host()->root_layer();
  target->RequestCopyOfOutput(CreateCopyOutputRequest().Pass());
  PostSetNeedsCommitToMainThread();
}

void LayerTreePixelTest::AfterTest() {
  base::FilePath test_data_dir;
  EXPECT_TRUE(PathService::Get(cc::DIR_TEST_DATA, &test_data_dir));
  base::FilePath ref_file_path = test_data_dir.Append(ref_file_);

  // To rebaseline:
  // EXPECT_TRUE(WritePNGFile(*result_bitmap_, ref_file_path, true));

  EXPECT_TRUE(MatchesPNGFile(*result_bitmap_,
                             ref_file_path,
                             *pixel_comparator_));
}

scoped_refptr<SolidColorLayer> LayerTreePixelTest::CreateSolidColorLayer(
    gfx::Rect rect, SkColor color) {
  scoped_refptr<SolidColorLayer> layer = SolidColorLayer::Create();
  layer->SetIsDrawable(true);
  layer->SetAnchorPoint(gfx::PointF());
  layer->SetBounds(rect.size());
  layer->SetPosition(rect.origin());
  layer->SetBackgroundColor(color);
  return layer;
}

scoped_refptr<SolidColorLayer> LayerTreePixelTest::
    CreateSolidColorLayerWithBorder(
        gfx::Rect rect, SkColor color, int border_width, SkColor border_color) {
  scoped_refptr<SolidColorLayer> layer = CreateSolidColorLayer(rect, color);
  scoped_refptr<SolidColorLayer> border_top = CreateSolidColorLayer(
      gfx::Rect(0, 0, rect.width(), border_width), border_color);
  scoped_refptr<SolidColorLayer> border_left = CreateSolidColorLayer(
      gfx::Rect(0,
                border_width,
                border_width,
                rect.height() - border_width * 2),
      border_color);
  scoped_refptr<SolidColorLayer> border_right = CreateSolidColorLayer(
      gfx::Rect(rect.width() - border_width,
                border_width,
                border_width,
                rect.height() - border_width * 2),
      border_color);
  scoped_refptr<SolidColorLayer> border_bottom = CreateSolidColorLayer(
      gfx::Rect(0, rect.height() - border_width, rect.width(), border_width),
      border_color);
  layer->AddChild(border_top);
  layer->AddChild(border_left);
  layer->AddChild(border_right);
  layer->AddChild(border_bottom);
  return layer;
}

void LayerTreePixelTest::RunPixelTest(
    scoped_refptr<Layer> content_root,
    base::FilePath file_name) {
  content_root_ = content_root;
  readback_target_ = NULL;
  ref_file_ = file_name;
  RunTest(true, false, true);
}

void LayerTreePixelTest::RunPixelTestWithReadbackTarget(
    scoped_refptr<Layer> content_root,
    Layer* target,
    base::FilePath file_name) {
  content_root_ = content_root;
  readback_target_ = target;
  ref_file_ = file_name;
  RunTest(true, false, true);
}

void LayerTreePixelTest::SetupTree() {
  scoped_refptr<Layer> root = Layer::Create();
  root->SetBounds(content_root_->bounds());
  root->AddChild(content_root_);
  layer_tree_host()->SetRootLayer(root);
  LayerTreeTest::SetupTree();
}

scoped_ptr<SkBitmap> LayerTreePixelTest::CopyTextureMailboxToBitmap(
    gfx::Size size,
    const TextureMailbox& texture_mailbox) {
  DCHECK(texture_mailbox.IsTexture());
  if (!texture_mailbox.IsTexture())
    return scoped_ptr<SkBitmap>();

  using webkit::gpu::WebGraphicsContext3DInProcessCommandBufferImpl;
  scoped_ptr<WebGraphicsContext3DInProcessCommandBufferImpl> context3d(
      WebGraphicsContext3DInProcessCommandBufferImpl::CreateOffscreenContext(
          WebKit::WebGraphicsContext3D::Attributes()));

  EXPECT_TRUE(context3d->makeContextCurrent());

  if (texture_mailbox.sync_point())
    context3d->waitSyncPoint(texture_mailbox.sync_point());

  unsigned texture_id = context3d->createTexture();
  context3d->bindTexture(GL_TEXTURE_2D, texture_id);
  context3d->texParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  context3d->texParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  context3d->texParameteri(
      GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
  context3d->texParameteri(
      GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
  context3d->consumeTextureCHROMIUM(texture_mailbox.target(),
                                    texture_mailbox.data());
  context3d->bindTexture(GL_TEXTURE_2D, 0);

  unsigned fbo = context3d->createFramebuffer();
  context3d->bindFramebuffer(GL_FRAMEBUFFER, fbo);
  context3d->framebufferTexture2D(GL_FRAMEBUFFER,
                                  GL_COLOR_ATTACHMENT0,
                                  GL_TEXTURE_2D,
                                  texture_id,
                                  0);
  EXPECT_EQ(static_cast<unsigned>(GL_FRAMEBUFFER_COMPLETE),
            context3d->checkFramebufferStatus(GL_FRAMEBUFFER));

  scoped_ptr<uint8[]> pixels(new uint8[size.GetArea() * 4]);
  context3d->readPixels(0,
                        0,
                        size.width(),
                        size.height(),
                        GL_RGBA,
                        GL_UNSIGNED_BYTE,
                        pixels.get());

  context3d->deleteFramebuffer(fbo);
  context3d->deleteTexture(texture_id);

  scoped_ptr<SkBitmap> bitmap(new SkBitmap);
  bitmap->setConfig(SkBitmap::kARGB_8888_Config,
                    size.width(),
                    size.height());
  bitmap->allocPixels();

  scoped_ptr<SkAutoLockPixels> lock(new SkAutoLockPixels(*bitmap));
  uint8* out_pixels = static_cast<uint8*>(bitmap->getPixels());

  size_t row_bytes = size.width() * 4;
  size_t total_bytes = size.height() * row_bytes;
  for (size_t dest_y = 0; dest_y < total_bytes; dest_y += row_bytes) {
    // Flip Y axis.
    size_t src_y = total_bytes - dest_y - row_bytes;
    // Swizzle OpenGL -> Skia byte order.
    for (size_t x = 0; x < row_bytes; x += 4) {
      out_pixels[dest_y + x + SK_R32_SHIFT/8] = pixels.get()[src_y + x + 0];
      out_pixels[dest_y + x + SK_G32_SHIFT/8] = pixels.get()[src_y + x + 1];
      out_pixels[dest_y + x + SK_B32_SHIFT/8] = pixels.get()[src_y + x + 2];
      out_pixels[dest_y + x + SK_A32_SHIFT/8] = pixels.get()[src_y + x + 3];
    }
  }

  return bitmap.Pass();
}

}  // namespace cc