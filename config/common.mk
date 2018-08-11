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
