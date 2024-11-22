#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit device configuration




PRODUCT_RELEASE_NAME := shusky

DEVICE_PATH := device/google/$(PRODUCT_RELEASE_NAME)


$(call inherit-product, $(DEVICE_PATH)/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)


ifeq ($(BUILD_VATIANT_SELF),FOX)
    $(call inherit-product, $(DEVICE_PATH)/fox_shusky.mk)
    $(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
    $(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
    $(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
    $(call inherit-product, vendor/twrp/config/common.mk)
else
    $(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
endif


PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := GOOGLE
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := GOOGLE 8/8 PRO

PRODUCT_GMS_CLIENTID_BASE := android-google
