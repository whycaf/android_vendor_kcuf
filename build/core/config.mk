# Copyright (C) 2015 The CyanogenMod Project
#           (C) 2017-2018 The LineageOS Project
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

KCUF_SRC_API_DIR := $(TOPDIR)prebuilts/kcuf-sdk/api
INTERNAL_KCUF_PLATFORM_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/kcuf_public_api.txt
INTERNAL_KCUF_PLATFORM_REMOVED_API_FILE := $(TARGET_OUT_COMMON_INTERMEDIATES)/PACKAGING/kcuf_removed.txt
FRAMEWORK_KCUF_PLATFORM_API_FILE := $(TOPDIR)kcuf-sdk/api/kcuf_current.txt
FRAMEWORK_KCUF_PLATFORM_REMOVED_API_FILE := $(TOPDIR)kcuf-sdk/api/kcuf_removed.txt
FRAMEWORK_KCUF_API_NEEDS_UPDATE_TEXT := $(TOPDIR)vendor/kcuf/build/core/apicheck_msg_current.txt

BUILD_RRO_SYSTEM_PACKAGE := $(TOPDIR)vendor/kcuf/build/core/system_rro.mk

# We modify several neverallows, so let the build proceed
ifneq ($(TARGET_BUILD_VARIANT),user)
SELINUX_IGNORE_NEVERALLOWS := true
endif

# Rules for MTK targets
include $(TOPDIR)vendor/kcuf/build/core/mtk_target.mk

# Rules for QCOM targets
include $(TOPDIR)vendor/kcuf/build/core/qcom_target.mk
