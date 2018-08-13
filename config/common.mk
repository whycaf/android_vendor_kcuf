# Generic product
PRODUCT_NAME := kcuf
PRODUCT_BRAND := kcuf
PRODUCT_DEVICE := generic

EXCLUDE_SYSTEMUI_TESTS := true

# version
include vendor/kcuf/config/version.mk

# Props
include vendor/kcuf/config/props.mk

# Packages
include vendor/kcuf/config/packages.mk

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/kcuf/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/kcuf/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/kcuf/prebuilt/common/bin/50-kcuf.sh:system/addon.d/50-kcuf.sh \
    vendor/kcuf/prebuilt/common/bin/blacklist:system/addon.d/blacklist

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/kcuf/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/kcuf/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/kcuf/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif
