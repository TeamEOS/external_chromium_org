/* Copyright (c) 2012 The Chromium Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
#ifndef LIBRARIES_NACL_IO_MOUNT_DEV_H_
#define LIBRARIES_NACL_IO_MOUNT_DEV_H_

#include "nacl_io/mount.h"

class MountNode;

class MountDev : public Mount {
 public:
  virtual Error Open(const Path& path, int mode, MountNode** out_node);

  virtual Error Unlink(const Path& path);
  virtual Error Mkdir(const Path& path, int permissions);
  virtual Error Rmdir(const Path& path);
  virtual Error Remove(const Path& path);

 protected:
  MountDev();

  virtual Error Init(int dev, StringMap_t& args, PepperInterface* ppapi);
  virtual void Destroy();

 private:
  MountNode* root_;

  friend class Mount;
};

#endif  // LIBRARIES_NACL_IO_MOUNT_DEV_H_