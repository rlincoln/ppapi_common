# Copyright (c) 2013 The Chromium Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# GNU Makefile based on shared rules provided by the Native Client SDK.
# See README.Makefiles for more details.

# newlib glibc pnacl linux mac win
VALID_TOOLCHAINS := pnacl

ifeq (,$(wildcard $(NACL_SDK_ROOT)/tools/oshelpers.py))
$(error NACL_SDK_ROOT is set to an invalid location: $(NACL_SDK_ROOT))
endif

CHROME_PATH ?= /opt/google/chrome-beta/google-chrome

TARGET = ppapi_common

include $(NACL_SDK_ROOT)/tools/common.mk

LIBS = ppapi pthread

CFLAGS = -Wall -std=c99
#LDFLAGS ?=
SOURCES = lib/ppapi_common.c

# Build rules generated by macros from common.mk:

$(foreach src,$(SOURCES),$(eval $(call COMPILE_RULE,$(src),$(CFLAGS))))

$(eval $(call LIB_RULE,$(TARGET),$(SOURCES)))
