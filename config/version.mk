# Copyright (C) 2016 The Pure Nexus Project
# Copyright (C) 2016 The JDCTeam
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

KCUF_MOD_VERSION = 9.0

ifndef KCUF_BUILD_TYPE
    KCUF_BUILD_TYPE := UNOFFICIAL
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(KCUF_BUILD_TYPE), OFFICIAL)
    LIST = $(shell curl -s https://raw.githubusercontent.com/KCUFRom/android_vendor_kcuf/p/kcuf.devices)
    FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
    ifneq ($(FOUND_DEVICE), $(CURRENT_DEVICE))
        KCUF_BUILD_TYPE := UNOFFICIAL
        $(error $(CURRENT_DEVICE) is not an Official Device)
    endif
endif

KCUF_VERSION := $(KCUF_MOD_VERSION)-$(CURRENT_DEVICE)-$(KCUF_BUILD_TYPE)-$(shell date -u +%Y%m%d)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.kcuf.version=$(KCUF_VERSION) \
  ro.kcuf.releasetype=$(KCUF_BUILD_TYPE) \
  ro.mod.version=$(KCUF_MOD_VERSION)

KCUF_DISPLAY_VERSION := KCUFRom-$(KCUF_MOD_VERSION)-$(KCUF_BUILD_TYPE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.kcuf.display.version=$(KCUF_DISPLAY_VERSION)
