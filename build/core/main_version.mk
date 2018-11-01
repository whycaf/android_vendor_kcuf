# KCUFRom System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.kcuf.version=$(KCUF_VERSION) \
    ro.kcuf.releasetype=$(KCUF_BUILD_TYPE) \
    ro.kcuf.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(KCUF_VERSION) \

# KCUFRom Platform Display Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.kcuf.display.version=$(KCUF_DISPLAY_VERSION)

# KCUFRom Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.kcuf.build.version.plat.sdk=$(KCUF_PLATFORM_SDK_VERSION)

# KCUFRom Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.kcuf.build.version.plat.rev=$(KCUF_PLATFORM_REV)
