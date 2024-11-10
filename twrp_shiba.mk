#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit device configuration
DEVICE_CODENAME := shiba
DEVICE_PATH := device/google/shusky
VENDOR_PATH := vendor/google/$(DEVICE_CODENAME)

# $(call inherit-product, device/google/zuma/lineage_common.mk)
# $(call inherit-product, device/google/zuma/device-common.mk)
# $(call inherit-product, device/google/gs-common/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
# Inherit some common recovery stuff
$(call inherit-product, $(DEVICE_PATH)/device.mk)
PRODUCT_DEVICE := $(DEVICE_CODENAME)
PRODUCT_NAME := twrp_$(DEVICE_CODENAME)
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 8
PRODUCT_MANUFACTURER := google

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="shiba-user 15 AP3A.241005.015 12366759 release-keys" \
    BuildFingerprint=google/shiba/shiba:15/AP3A.241005.015/12366759:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
# ModemDiagnosticSystem for desense tool
PRODUCT_PACKAGES += \
    ModemDiagnosticSystem \