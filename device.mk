#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += build.variant.self=$(BUILD_VATIANT_SELF)

DEVICE_PATH := device/google/shusky

PLATFORM_SECURITY_PATCH := 2099-12-31

VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)



PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
PLATFORM_VERSION := 14
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_PACKAGES += linker.vendor_ramdisk
PRODUCT_PACKAGES += resize2fs.vendor_ramdisk
PRODUCT_PACKAGES += fsck.vendor_ramdisk
PRODUCT_PACKAGES += tune2fs.vendor_ramdisk
PRODUCT_PACKAGES += fstab.zuma.vendor_ramdisk
PRODUCT_PACKAGES += update_engine_sideload
PRODUCT_PACKAGES += libdisplaycolor
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so
PRODUCT_PACKAGES += android.hardware.boot@1.2-service-pixel
PRODUCT_PACKAGES += android.hardware.boot@1.2-impl-pixel
PRODUCT_PACKAGES += fastbootd
AB_OTA_POSTINSTALL_CONFIG += RUN_POSTINSTALL_system=true
AB_OTA_POSTINSTALL_CONFIG += POSTINSTALL_PATH_system=system/bin/otapreopt_script
AB_OTA_POSTINSTALL_CONFIG += POSTINSTALL_OPTIONAL_system=true
AB_OTA_POSTINSTALL_CONFIG += FILESYSTEM_TYPE_system=ext4

PRODUCT_PACKAGES += otapreopt_script
PRODUCT_PACKAGES += checkpoint_gc
PRODUCT_PACKAGES += cppreopts.sh
PRODUCT_PACKAGES += update_engine
PRODUCT_PACKAGES += update_verifier
PRODUCT_PACKAGES += e2fsck.vendor_ramdisk libsysutils

TARGET_RECOVERY_DEVICE_MODULES += libion
TARGET_RECOVERY_DEVICE_MODULES += vendor.display.config@1.0 
TARGET_RECOVERY_DEVICE_MODULES += vendor.display.config@2.0
RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so
BOARD_USES_METADATA_PARTITION := true
PRODUCT_PACKAGES += fstab.zuma-fips.vendor_ramdisk
PRODUCT_PACKAGES += resize.f2fs.vendor_ramdisk
PRODUCT_PACKAGES += linker_hwasan64.vendor_ramdisk
PRODUCT_PACKAGES += dump.f2fs.vendor_ramdisk
PRODUCT_PACKAGES += defrag.f2fs.vendor_ramdisk
PRODUCT_PACKAGES += libtrusty
PRODUCT_PACKAGES += vndservicemanager
PRODUCT_PACKAGES += vndservice
PRODUCT_PACKAGES += libhidltransport.vendor
PRODUCT_PACKAGES += audioroute

PRODUCT_PACKAGES += libaudioroutelite

ifeq ($(BUILD_VATIANT_SELF),PB)

    PRODUCT_SHIPPING_API_LEVEL := 34
    PRODUCT_TARGET_VNDK_VERSION := 34
    TARGET_VNDK_VERSION := 34
    
    DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/included-stuff/manifest.xml
    PRODUCT_ENFORCE_VINTF_MANIFEST := true

    PRODUCT_PACKAGES += bootctl
    PRODUCT_PACKAGES += logcat
    PRODUCT_PACKAGES += logd 
    PRODUCT_PACKAGES += auditctl
    PRODUCT_PACKAGES += libsysutils libcap
    RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libcap
    RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libsysutils.so
    RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/auditctl
    RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/bootctl
    RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/logcat
    RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/logd
    # PRODUCT_PACKAGES += android.hardware.fastboot@1.1-impl-pixel
else

    PRODUCT_SHIPPING_API_LEVEL := 30
    PRODUCT_TARGET_VNDK_VERSION := 31
    ENABLE_VIRTUAL_AB := true


endif
