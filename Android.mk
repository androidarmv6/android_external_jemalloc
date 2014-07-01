#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

#-----------------------------------------------------------------------
# jemalloc static library
#-----------------------------------------------------------------------
include $(CLEAR_VARS)

LOCAL_MODULE := libjemalloc
LOCAL_MODULE_TAGS := optional

LOCAL_ADDITIONAL_DEPENDENCIES := \
	$(LOCAL_PATH)/Android.mk \

LOCAL_CFLAGS := \
	-std=gnu99 \
	-D_REENTRANT \
	-fvisibility=hidden \
	-Wno-unused-parameter \

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/src \
	$(LOCAL_PATH)/include \


LOCAL_SRC_FILES := \
	src/arena.c \
	src/atomic.c \
	src/base.c \
	src/bitmap.c \
	src/chunk.c \
	src/chunk_dss.c \
	src/chunk_mmap.c \
	src/ckh.c \
	src/ctl.c \
	src/extent.c \
	src/hash.c \
	src/huge.c \
	src/jemalloc.c \
	src/mb.c \
	src/mutex.c \
	src/prof.c \
	src/quarantine.c \
	src/rtree.c \
	src/stats.c \
	src/tcache.c \
	src/tsd.c \
	src/util.c \

# Simple Android implementation of mallinfo.
LOCAL_SRC_FILES += \
	android/src/je_mallinfo.c

include $(BUILD_STATIC_LIBRARY)
