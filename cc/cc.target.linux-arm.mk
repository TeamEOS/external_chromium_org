# This file is generated by gyp; do not edit.

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE := cc_cc_gyp
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TARGET_ARCH := $(TARGET_$(GYP_VAR_PREFIX)ARCH)
gyp_intermediate_dir := $(call local-intermediates-dir,,$(GYP_VAR_PREFIX))
gyp_shared_intermediate_dir := $(call intermediates-dir-for,GYP,shared,,,$(GYP_VAR_PREFIX))

# Make sure our deps are built first.
GYP_TARGET_DEPENDENCIES := \
	$(call intermediates-dir-for,GYP,gpu_gpu_gyp,,,$(GYP_VAR_PREFIX))/gpu.stamp \
	$(call intermediates-dir-for,GYP,skia_skia_gyp,,,$(GYP_VAR_PREFIX))/skia.stamp \
	$(call intermediates-dir-for,STATIC_LIBRARIES,skia_skia_library_gyp,,,$(GYP_VAR_PREFIX))/skia_skia_library_gyp.a \
	$(call intermediates-dir-for,STATIC_LIBRARIES,ui_gl_gl_gyp,,,$(GYP_VAR_PREFIX))/ui_gl_gl_gyp.a

GYP_GENERATED_OUTPUTS :=

# Make sure our deps and generated files are built first.
LOCAL_ADDITIONAL_DEPENDENCIES := $(GYP_TARGET_DEPENDENCIES) $(GYP_GENERATED_OUTPUTS)

LOCAL_CPP_EXTENSION := .cc
LOCAL_GENERATED_SOURCES :=

GYP_COPIED_SOURCE_ORIGIN_DIRS :=

LOCAL_SRC_FILES := \
	cc/animation/animation.cc \
	cc/animation/animation_curve.cc \
	cc/animation/animation_events.cc \
	cc/animation/animation_id_provider.cc \
	cc/animation/animation_registrar.cc \
	cc/animation/keyframed_animation_curve.cc \
	cc/animation/layer_animation_controller.cc \
	cc/animation/scroll_offset_animation_curve.cc \
	cc/animation/scrollbar_animation_controller.cc \
	cc/animation/scrollbar_animation_controller_linear_fade.cc \
	cc/animation/scrollbar_animation_controller_thinning.cc \
	cc/animation/timing_function.cc \
	cc/animation/transform_operation.cc \
	cc/animation/transform_operations.cc \
	cc/base/delayed_unique_notifier.cc \
	cc/base/invalidation_region.cc \
	cc/base/latency_info_swap_promise.cc \
	cc/base/latency_info_swap_promise_monitor.cc \
	cc/base/math_util.cc \
	cc/base/region.cc \
	cc/base/rolling_time_delta_history.cc \
	cc/base/swap_promise_monitor.cc \
	cc/base/switches.cc \
	cc/base/tiling_data.cc \
	cc/base/unique_notifier.cc \
	cc/debug/benchmark_instrumentation.cc \
	cc/debug/debug_colors.cc \
	cc/debug/debug_rect_history.cc \
	cc/debug/frame_rate_counter.cc \
	cc/debug/invalidation_benchmark.cc \
	cc/debug/lap_timer.cc \
	cc/debug/layer_tree_debug_state.cc \
	cc/debug/micro_benchmark.cc \
	cc/debug/micro_benchmark_impl.cc \
	cc/debug/micro_benchmark_controller.cc \
	cc/debug/micro_benchmark_controller_impl.cc \
	cc/debug/paint_time_counter.cc \
	cc/debug/picture_record_benchmark.cc \
	cc/debug/rasterize_and_record_benchmark.cc \
	cc/debug/rasterize_and_record_benchmark_impl.cc \
	cc/debug/rendering_stats.cc \
	cc/debug/rendering_stats_instrumentation.cc \
	cc/debug/traced_picture.cc \
	cc/debug/traced_value.cc \
	cc/debug/unittest_only_benchmark.cc \
	cc/debug/unittest_only_benchmark_impl.cc \
	cc/input/page_scale_animation.cc \
	cc/input/top_controls_manager.cc \
	cc/layers/content_layer.cc \
	cc/layers/contents_scaling_layer.cc \
	cc/layers/delegated_frame_provider.cc \
	cc/layers/delegated_frame_resource_collection.cc \
	cc/layers/delegated_renderer_layer.cc \
	cc/layers/delegated_renderer_layer_impl.cc \
	cc/layers/heads_up_display_layer.cc \
	cc/layers/heads_up_display_layer_impl.cc \
	cc/layers/image_layer.cc \
	cc/layers/io_surface_layer.cc \
	cc/layers/io_surface_layer_impl.cc \
	cc/layers/layer.cc \
	cc/layers/layer_impl.cc \
	cc/layers/layer_lists.cc \
	cc/layers/layer_position_constraint.cc \
	cc/layers/layer_utils.cc \
	cc/layers/nine_patch_layer.cc \
	cc/layers/nine_patch_layer_impl.cc \
	cc/layers/painted_scrollbar_layer.cc \
	cc/layers/painted_scrollbar_layer_impl.cc \
	cc/layers/picture_image_layer.cc \
	cc/layers/picture_image_layer_impl.cc \
	cc/layers/picture_layer.cc \
	cc/layers/picture_layer_impl.cc \
	cc/layers/quad_sink.cc \
	cc/layers/render_surface.cc \
	cc/layers/render_surface_impl.cc \
	cc/layers/scrollbar_layer_impl_base.cc \
	cc/layers/solid_color_layer.cc \
	cc/layers/solid_color_layer_impl.cc \
	cc/layers/solid_color_scrollbar_layer.cc \
	cc/layers/solid_color_scrollbar_layer_impl.cc \
	cc/layers/surface_layer.cc \
	cc/layers/surface_layer_impl.cc \
	cc/layers/texture_layer.cc \
	cc/layers/texture_layer_impl.cc \
	cc/layers/tiled_layer.cc \
	cc/layers/tiled_layer_impl.cc \
	cc/layers/ui_resource_layer.cc \
	cc/layers/ui_resource_layer_impl.cc \
	cc/layers/video_frame_provider_client_impl.cc \
	cc/layers/video_layer.cc \
	cc/layers/video_layer_impl.cc \
	cc/output/begin_frame_args.cc \
	cc/output/compositor_frame.cc \
	cc/output/compositor_frame_ack.cc \
	cc/output/compositor_frame_metadata.cc \
	cc/output/context_provider.cc \
	cc/output/copy_output_request.cc \
	cc/output/copy_output_result.cc \
	cc/output/delegated_frame_data.cc \
	cc/output/delegating_renderer.cc \
	cc/output/direct_renderer.cc \
	cc/output/filter_operation.cc \
	cc/output/filter_operations.cc \
	cc/output/geometry_binding.cc \
	cc/output/gl_frame_data.cc \
	cc/output/gl_renderer.cc \
	cc/output/gl_renderer_draw_cache.cc \
	cc/output/managed_memory_policy.cc \
	cc/output/output_surface.cc \
	cc/output/overlay_candidate.cc \
	cc/output/overlay_processor.cc \
	cc/output/overlay_strategy_single_on_top.cc \
	cc/output/program_binding.cc \
	cc/output/render_surface_filters.cc \
	cc/output/renderer.cc \
	cc/output/shader.cc \
	cc/output/software_frame_data.cc \
	cc/output/software_output_device.cc \
	cc/output/software_renderer.cc \
	cc/quads/checkerboard_draw_quad.cc \
	cc/quads/content_draw_quad_base.cc \
	cc/quads/debug_border_draw_quad.cc \
	cc/quads/draw_quad.cc \
	cc/quads/io_surface_draw_quad.cc \
	cc/quads/picture_draw_quad.cc \
	cc/quads/render_pass.cc \
	cc/quads/render_pass_draw_quad.cc \
	cc/quads/shared_quad_state.cc \
	cc/quads/solid_color_draw_quad.cc \
	cc/quads/stream_video_draw_quad.cc \
	cc/quads/surface_draw_quad.cc \
	cc/quads/texture_draw_quad.cc \
	cc/quads/tile_draw_quad.cc \
	cc/quads/yuv_video_draw_quad.cc \
	cc/resources/bitmap_content_layer_updater.cc \
	cc/resources/bitmap_skpicture_content_layer_updater.cc \
	cc/resources/content_layer_updater.cc \
	cc/resources/direct_raster_worker_pool.cc \
	cc/resources/image_layer_updater.cc \
	cc/resources/image_raster_worker_pool.cc \
	cc/resources/image_copy_raster_worker_pool.cc \
	cc/resources/layer_quad.cc \
	cc/resources/layer_tiling_data.cc \
	cc/resources/layer_updater.cc \
	cc/resources/managed_tile_state.cc \
	cc/resources/memory_history.cc \
	cc/resources/picture.cc \
	cc/resources/picture_layer_tiling.cc \
	cc/resources/picture_layer_tiling_set.cc \
	cc/resources/picture_pile.cc \
	cc/resources/picture_pile_base.cc \
	cc/resources/picture_pile_impl.cc \
	cc/resources/pixel_buffer_raster_worker_pool.cc \
	cc/resources/prioritized_resource.cc \
	cc/resources/prioritized_resource_manager.cc \
	cc/resources/prioritized_tile_set.cc \
	cc/resources/priority_calculator.cc \
	cc/resources/raster_mode.cc \
	cc/resources/raster_worker_pool.cc \
	cc/resources/rasterizer.cc \
	cc/resources/resource.cc \
	cc/resources/resource_format.cc \
	cc/resources/resource_pool.cc \
	cc/resources/resource_provider.cc \
	cc/resources/resource_update.cc \
	cc/resources/resource_update_controller.cc \
	cc/resources/resource_update_queue.cc \
	cc/resources/scoped_resource.cc \
	cc/resources/scoped_ui_resource.cc \
	cc/resources/shared_bitmap.cc \
	cc/resources/single_release_callback.cc \
	cc/resources/skpicture_content_layer_updater.cc \
	cc/resources/task_graph_runner.cc \
	cc/resources/texture_mailbox.cc \
	cc/resources/texture_mailbox_deleter.cc \
	cc/resources/texture_uploader.cc \
	cc/resources/tile.cc \
	cc/resources/tile_manager.cc \
	cc/resources/tile_priority.cc \
	cc/resources/transferable_resource.cc \
	cc/resources/ui_resource_bitmap.cc \
	cc/resources/ui_resource_request.cc \
	cc/resources/video_resource_updater.cc \
	cc/scheduler/delay_based_time_source.cc \
	cc/scheduler/scheduler.cc \
	cc/scheduler/scheduler_settings.cc \
	cc/scheduler/scheduler_state_machine.cc \
	cc/trees/blocking_task_runner.cc \
	cc/trees/damage_tracker.cc \
	cc/trees/layer_sorter.cc \
	cc/trees/layer_tree_host.cc \
	cc/trees/layer_tree_host_common.cc \
	cc/trees/layer_tree_host_impl.cc \
	cc/trees/layer_tree_impl.cc \
	cc/trees/layer_tree_settings.cc \
	cc/trees/occlusion_tracker.cc \
	cc/trees/proxy.cc \
	cc/trees/proxy_timing_history.cc \
	cc/trees/single_thread_proxy.cc \
	cc/trees/thread_proxy.cc \
	cc/trees/tree_synchronizer.cc


# Flags passed to both C and C++ files.
MY_CFLAGS_Debug := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-Wno-unused-local-typedefs \
	-fno-tree-sra \
	-fno-partial-inlining \
	-fno-early-inlining \
	-fno-tree-copy-prop \
	-fno-tree-loop-optimize \
	-fno-move-loop-invariants \
	-fno-caller-saves \
	-Wno-psabi \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fstack-protector \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	-U_FORTIFY_SOURCE \
	-Wno-extra \
	-Wno-ignored-qualifiers \
	-Wno-type-limits \
	-Wno-unused-but-set-variable \
	-Os \
	-g \
	-fdata-sections \
	-ffunction-sections \
	-fomit-frame-pointer \
	-funwind-tables

MY_DEFS_Debug := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DBLINK_SCALE_FILTERS_AT_RECORD_TIME' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DNO_TCMALLOC' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DENABLE_WEBRTC=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_BROWSER_CDMS' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DDISCARDABLE_MEMORY_ALWAYS_SUPPORTED_NATIVELY' \
	'-DSYSTEM_NATIVELY_SIGNALS_MEMORY_PRESSURE' \
	'-DENABLE_EGLIMAGE=1' \
	'-DCLD_VERSION=1' \
	'-DENABLE_PRINTING=1' \
	'-DENABLE_MANAGED_USERS=1' \
	'-DDATA_REDUCTION_FALLBACK_HOST="http://compress.googlezip.net:80/"' \
	'-DDATA_REDUCTION_DEV_HOST="http://proxy-dev.googlezip.net:80/"' \
	'-DSPDY_PROXY_AUTH_ORIGIN="https://proxy.googlezip.net:443/"' \
	'-DDATA_REDUCTION_PROXY_PROBE_URL="http://check.googlezip.net/connect"' \
	'-DDATA_REDUCTION_PROXY_WARMUP_URL="http://www.gstatic.com/generate_204"' \
	'-DVIDEO_HOLE=1' \
	'-DCC_IMPLEMENTATION=1' \
	'-DMEDIA_DISABLE_LIBVPX' \
	'-DSK_ENABLE_INST_COUNT=0' \
	'-DSK_SUPPORT_GPU=1' \
	'-DGR_GL_CUSTOM_SETUP_HEADER="GrGLConfig_chrome.h"' \
	'-DSK_ENABLE_LEGACY_API_ALIASING=1' \
	'-DSK_ATTR_DEPRECATED=SK_NOTHING_ARG1' \
	'-DGR_GL_IGNORE_ES3_MSAA=0' \
	'-DSK_WILL_NEVER_DRAW_PERSPECTIVE_TEXT' \
	'-DSK_SUPPORT_LEGACY_GETTOPDEVICE' \
	'-DSK_SUPPORT_LEGACY_BITMAP_CONFIG' \
	'-DSK_SUPPORT_LEGACY_DEVICE_VIRTUAL_ISOPAQUE' \
	'-DSK_SUPPORT_LEGACY_N32_NAME' \
	'-DSK_SUPPORT_LEGACY_SETCONFIG' \
	'-DSK_IGNORE_ETC1_SUPPORT' \
	'-DSK_IGNORE_GPU_DITHER' \
	'-DSK_SUPPORT_LEGACY_GETTOTALCLIP' \
	'-DSK_BUILD_FOR_ANDROID' \
	'-DSK_USE_POSIX_THREADS' \
	'-DSK_DEFERRED_CANVAS_USES_FACTORIES=1' \
	'-DU_USING_ICU_NAMESPACE=0' \
	'-DMESA_EGL_NO_X11_HEADERS' \
	'-DUSE_OPENSSL=1' \
	'-DUSE_OPENSSL_CERTS=1' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DANDROID' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=1' \
	'-DWTF_USE_DYNAMIC_ANNOTATIONS=1' \
	'-D_DEBUG'


# Include paths placed before CFLAGS/CPPFLAGS
LOCAL_C_INCLUDES_Debug := \
	$(gyp_shared_intermediate_dir)/shim_headers/icuuc/target \
	$(gyp_shared_intermediate_dir)/shim_headers/icui18n/target \
	$(gyp_shared_intermediate_dir)/shim_headers/ashmem/target \
	$(gyp_shared_intermediate_dir) \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/third_party/khronos \
	$(LOCAL_PATH)/gpu \
	$(LOCAL_PATH)/skia/config \
	$(LOCAL_PATH)/third_party/skia/src/core \
	$(LOCAL_PATH)/third_party/skia/include/core \
	$(LOCAL_PATH)/third_party/skia/include/effects \
	$(LOCAL_PATH)/third_party/skia/include/pdf \
	$(LOCAL_PATH)/third_party/skia/include/gpu \
	$(LOCAL_PATH)/third_party/skia/include/lazy \
	$(LOCAL_PATH)/third_party/skia/include/pathops \
	$(LOCAL_PATH)/third_party/skia/include/pipe \
	$(LOCAL_PATH)/third_party/skia/include/ports \
	$(LOCAL_PATH)/third_party/skia/include/utils \
	$(LOCAL_PATH)/skia/ext \
	$(PWD)/external/icu4c/common \
	$(PWD)/external/icu4c/i18n \
	$(gyp_shared_intermediate_dir)/ui/gl \
	$(LOCAL_PATH)/third_party/mesa/src/include \
	$(PWD)/frameworks/wilhelm/include \
	$(PWD)/bionic \
	$(PWD)/external/stlport/stlport


# Flags passed to only C++ (and not C) files.
LOCAL_CPPFLAGS_Debug := \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Wno-abi \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo


# Flags passed to both C and C++ files.
MY_CFLAGS_Release := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-Wno-unused-local-typedefs \
	-fno-tree-sra \
	-fno-partial-inlining \
	-fno-early-inlining \
	-fno-tree-copy-prop \
	-fno-tree-loop-optimize \
	-fno-move-loop-invariants \
	-fno-caller-saves \
	-Wno-psabi \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fstack-protector \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	-U_FORTIFY_SOURCE \
	-Wno-extra \
	-Wno-ignored-qualifiers \
	-Wno-type-limits \
	-Wno-unused-but-set-variable \
	-Os \
	-fno-ident \
	-fdata-sections \
	-ffunction-sections \
	-fomit-frame-pointer \
	-funwind-tables

MY_DEFS_Release := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DBLINK_SCALE_FILTERS_AT_RECORD_TIME' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DNO_TCMALLOC' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DENABLE_WEBRTC=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_BROWSER_CDMS' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DDISCARDABLE_MEMORY_ALWAYS_SUPPORTED_NATIVELY' \
	'-DSYSTEM_NATIVELY_SIGNALS_MEMORY_PRESSURE' \
	'-DENABLE_EGLIMAGE=1' \
	'-DCLD_VERSION=1' \
	'-DENABLE_PRINTING=1' \
	'-DENABLE_MANAGED_USERS=1' \
	'-DDATA_REDUCTION_FALLBACK_HOST="http://compress.googlezip.net:80/"' \
	'-DDATA_REDUCTION_DEV_HOST="http://proxy-dev.googlezip.net:80/"' \
	'-DSPDY_PROXY_AUTH_ORIGIN="https://proxy.googlezip.net:443/"' \
	'-DDATA_REDUCTION_PROXY_PROBE_URL="http://check.googlezip.net/connect"' \
	'-DDATA_REDUCTION_PROXY_WARMUP_URL="http://www.gstatic.com/generate_204"' \
	'-DVIDEO_HOLE=1' \
	'-DCC_IMPLEMENTATION=1' \
	'-DMEDIA_DISABLE_LIBVPX' \
	'-DSK_ENABLE_INST_COUNT=0' \
	'-DSK_SUPPORT_GPU=1' \
	'-DGR_GL_CUSTOM_SETUP_HEADER="GrGLConfig_chrome.h"' \
	'-DSK_ENABLE_LEGACY_API_ALIASING=1' \
	'-DSK_ATTR_DEPRECATED=SK_NOTHING_ARG1' \
	'-DGR_GL_IGNORE_ES3_MSAA=0' \
	'-DSK_WILL_NEVER_DRAW_PERSPECTIVE_TEXT' \
	'-DSK_SUPPORT_LEGACY_GETTOPDEVICE' \
	'-DSK_SUPPORT_LEGACY_BITMAP_CONFIG' \
	'-DSK_SUPPORT_LEGACY_DEVICE_VIRTUAL_ISOPAQUE' \
	'-DSK_SUPPORT_LEGACY_N32_NAME' \
	'-DSK_SUPPORT_LEGACY_SETCONFIG' \
	'-DSK_IGNORE_ETC1_SUPPORT' \
	'-DSK_IGNORE_GPU_DITHER' \
	'-DSK_SUPPORT_LEGACY_GETTOTALCLIP' \
	'-DSK_BUILD_FOR_ANDROID' \
	'-DSK_USE_POSIX_THREADS' \
	'-DSK_DEFERRED_CANVAS_USES_FACTORIES=1' \
	'-DU_USING_ICU_NAMESPACE=0' \
	'-DMESA_EGL_NO_X11_HEADERS' \
	'-DUSE_OPENSSL=1' \
	'-DUSE_OPENSSL_CERTS=1' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DANDROID' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DNDEBUG' \
	'-DNVALGRIND' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=0' \
	'-D_FORTIFY_SOURCE=2'


# Include paths placed before CFLAGS/CPPFLAGS
LOCAL_C_INCLUDES_Release := \
	$(gyp_shared_intermediate_dir)/shim_headers/icuuc/target \
	$(gyp_shared_intermediate_dir)/shim_headers/icui18n/target \
	$(gyp_shared_intermediate_dir)/shim_headers/ashmem/target \
	$(gyp_shared_intermediate_dir) \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/third_party/khronos \
	$(LOCAL_PATH)/gpu \
	$(LOCAL_PATH)/skia/config \
	$(LOCAL_PATH)/third_party/skia/src/core \
	$(LOCAL_PATH)/third_party/skia/include/core \
	$(LOCAL_PATH)/third_party/skia/include/effects \
	$(LOCAL_PATH)/third_party/skia/include/pdf \
	$(LOCAL_PATH)/third_party/skia/include/gpu \
	$(LOCAL_PATH)/third_party/skia/include/lazy \
	$(LOCAL_PATH)/third_party/skia/include/pathops \
	$(LOCAL_PATH)/third_party/skia/include/pipe \
	$(LOCAL_PATH)/third_party/skia/include/ports \
	$(LOCAL_PATH)/third_party/skia/include/utils \
	$(LOCAL_PATH)/skia/ext \
	$(PWD)/external/icu4c/common \
	$(PWD)/external/icu4c/i18n \
	$(gyp_shared_intermediate_dir)/ui/gl \
	$(LOCAL_PATH)/third_party/mesa/src/include \
	$(PWD)/frameworks/wilhelm/include \
	$(PWD)/bionic \
	$(PWD)/external/stlport/stlport


# Flags passed to only C++ (and not C) files.
LOCAL_CPPFLAGS_Release := \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Wno-abi \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo


LOCAL_CFLAGS := $(MY_CFLAGS_$(GYP_CONFIGURATION)) $(MY_DEFS_$(GYP_CONFIGURATION))
LOCAL_C_INCLUDES := $(GYP_COPIED_SOURCE_ORIGIN_DIRS) $(LOCAL_C_INCLUDES_$(GYP_CONFIGURATION))
LOCAL_CPPFLAGS := $(LOCAL_CPPFLAGS_$(GYP_CONFIGURATION))
LOCAL_ASFLAGS := $(LOCAL_CFLAGS)
### Rules for final target.

LOCAL_LDFLAGS_Debug := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,--fatal-warnings \
	-Wl,-z,noexecstack \
	-fPIC \
	-Wl,-z,relro \
	-Wl,-z,now \
	-fuse-ld=gold \
	-nostdlib \
	-Wl,--no-undefined \
	-Wl,--exclude-libs=ALL \
	-Wl,--icf=safe \
	-Wl,--warn-shared-textrel \
	-Wl,-O1 \
	-Wl,--as-needed


LOCAL_LDFLAGS_Release := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,--fatal-warnings \
	-Wl,-z,noexecstack \
	-fPIC \
	-Wl,-z,relro \
	-Wl,-z,now \
	-fuse-ld=gold \
	-nostdlib \
	-Wl,--no-undefined \
	-Wl,--exclude-libs=ALL \
	-Wl,--icf=safe \
	-Wl,-O1 \
	-Wl,--as-needed \
	-Wl,--gc-sections \
	-Wl,--warn-shared-textrel


LOCAL_LDFLAGS := $(LOCAL_LDFLAGS_$(GYP_CONFIGURATION))

LOCAL_STATIC_LIBRARIES := \
	skia_skia_library_gyp \
	ui_gl_gl_gyp

# Enable grouping to fix circular references
LOCAL_GROUP_STATIC_LIBRARIES := true

LOCAL_SHARED_LIBRARIES := \
	libstlport \
	libdl

# Add target alias to "gyp_all_modules" target.
.PHONY: gyp_all_modules
gyp_all_modules: cc_cc_gyp

# Alias gyp target name.
.PHONY: cc
cc: cc_cc_gyp

include $(BUILD_STATIC_LIBRARY)
