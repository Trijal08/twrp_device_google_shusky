#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#




DEVICE_PATH := device/google/shusky

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/pixel-stuff/board-info.txt
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true
TARGET_USES_LOGD := true

AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += boot
AB_OTA_PARTITIONS += init_boot
AB_OTA_PARTITIONS += vendor_boot
AB_OTA_PARTITIONS += dtbo
AB_OTA_PARTITIONS += vbmeta
AB_OTA_PARTITIONS += vbmeta_system
AB_OTA_PARTITIONS += vbmeta_vendor
AB_OTA_PARTITIONS += product
AB_OTA_PARTITIONS += system
AB_OTA_PARTITIONS += system_ext
AB_OTA_PARTITIONS += system_dlkm
AB_OTA_PARTITIONS += vendor
AB_OTA_PARTITIONS += vendor_dlkm
AB_OTA_PARTITIONS += modem
AB_OTA_PARTITIONS += vendor_kernel_boot
AB_OTA_PARTITIONS += tzsw
AB_OTA_PARTITIONS += idfw
AB_OTA_PARTITIONS += abl
AB_OTA_PARTITIONS += pvmfw
AB_OTA_PARTITIONS += bl2
AB_OTA_PARTITIONS += gsa
AB_OTA_PARTITIONS += bl31
AB_OTA_PARTITIONS += pbl
AB_OTA_PARTITIONS += gsa_bl1
AB_OTA_PARTITIONS += bl1
AB_OTA_PARTITIONS += gcf



TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_VARIANT := cortex-a55
TARGET_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=

PRODUCT_PLATFORM := zuma

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armv8-2a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)
TARGET_NO_BOOTLOADER := true

TARGET_USES_UEFI := true

TARGET_BOARD_PLATFORM := $(GOOGLE_BOARD_PLATFORMS)
TARGET_BOARD_PLATFORM_GPU := mali-g71
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE   := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.lz4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888

# TARGET_RECOVERY_PIXEL_FORMAT := RGB_565 Nont booted
# TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888 Uses, But orange its Blues, cute
# TARGET_RECOVERY_PIXEL_FORMAT := ARGB_8888 Not useles, black screen
# TARGET_RECOVERY_PIXEL_FORMAT := RGBA_8888 Not useles black screen
# TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888 Not useles EXTRAAA GREEEN
# TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888" Not useles EXTRAAA ORANGE

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/included-stuff/system.prop
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/included-stuff/recovery.fstab
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/included-stuff/recovery.wipe

VENDOR_CMDLINE := "dyndbg=\"func alloc_contig_dump_pages +p\" \
        earlycon=exynos4210,0x10A00000 \
        console=ttySAC0,115200 \
        androidboot.console=ttySAC0 \
        printk.devkmsg=on \
        swiotlb=noforce \
        cma_sysfs.experimental=Y \
        cgroup_disable=memory \
        rcupdate.rcu_expedited=1 \
        rcu_nocbs=all \
        stack_depot_disable=off \
        page_pinner=on \
        swiotlb=1024 \
        disable_dma32=on \
        at24.write_timeout=100 \
        log_buf_len=1024K \
        bootconfig"

BOARD_BOOTCONFIG += androidboot.boot_devices=13200000.ufs
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

BOARD_FLASH_BLOCK_SIZE := 131072


BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true


BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtbs
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbs/dtbo.img


BOARD_KERNEL_PAGESIZE    := 2048
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE        := 0x1000000
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET         := 0x01f00000
BOARD_KERNEL_IMAGE_NAME := Image.lz4
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(VENDOR_CMDLINE)

BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_AVB_ENABLE := true
BOARD_SUPER_PARTITION_SIZE := 8531214336
BOARD_SUPER_PARTITION_GROUPS := google_dynamic_partitions
BOARD_GOOGLE_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm product #
BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE := 8527020032


BOARD_HAS_LARGE_FILESYSTEM := true


TW_EXCLUDE_APEX := true
ALLOW_MISSING_DEPENDENCIES := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

TARGET_USES_MKE2FS := true
RECOVERY_SDCARD_ON_DATA := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 3827
TW_DEFAULT_BRIGHTNESS := 219
TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_FASTBOOTD := true
TW_THEME := portrait_hdpi
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en
TW_LOAD_VENDOR_DLKM_MODULES := "heatmap.ko touch_offload.ko ftm5.ko sec_touch.ko goodix_brl_touch.ko goog_touch_interface.ko" #
TW_LOAD_VENDOR_MODULES := "heatmap.ko touch_offload.ko ftm5.ko sec_touch.ko goodix_brl_touch.ko goog_touch_interface.ko" #
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
TW_FRAMERATE := 120
TW_USE_SAMSUNG_HAPTICS := true
TWRP_EVENT_LOGGING := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPTOOLS := true
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone48/temp"
TW_BATTERY_SYSFS_WAIT_SECONDS := 6
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_RAMDISK_USE_LZ4 := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TARGET_SCREEN_WIDTH := 1344
TARGET_SCREEN_HEIGHT := 2992

BOARD_VENDOR := google
TARGET_OTA_ASSERT_DEVICE := shiba,husky
GOOGLE_BOARD_PLATFORMS += zuma

TARGET_NO_RECOVERY := true
LC_ALL := C
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true
BUILD_BROKEN_USES_NETWORK := true
TW_NO_SCREEN_BLANK := true
TW_INCLUDE_PYTHON := true
TW_VERSION := LeeGarChat

ifeq ($(BUILD_VATIANT_SELF),PB)
    PB_DISABLE_DEFAULT_DM_VERITY := true
    # TARGET_SOC := zuma
    # TARGET_SOC_NAME := google
    # TARGET_SCREEN_DENSITY := 480
    # TARGET_USES_VULKAN := true
    # TARGET_KERNEL_DTBO_PREFIX := dts/
    # TARGET_KERNEL_DTBO := google-devices/shusky/dtbo.img
    # TARGET_KERNEL_CONFIG := gki_defconfig
    # TARGET_RECOVERY_UI_MARGIN_HEIGHT := 165
    # TARGET_RECOVERY_UI_LIB := librecovery_ui_pixel
    # TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := false
    # TARGET_USES_HWC2 := true
    
    # USES_DEVICE_GOOGLE_ZUMA := true
    # USES_DEVICE_GOOGLE_$(DEVICE_CODENAME) := true
    # USES_DEVICE_GOOGLE_SHUSKY := true
    # ZYGOTE_FORCE_64 := true
    # IGNORE_PREFER32_ON_DEVICE := true
    # DEXPREOPT_GENERATE_APEX_IMAGE := true
    # BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
    # BOARD_KERNEL_CMDLINE += exynos_drm.load_sequential=1
    # BOARD_EGL_CFG := $(DEVICE_PATH)/conf/egl.cfg
    # BOARD_EMULATOR_COMMON_MODULES := liblight
    # BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat $(DEVICE_PATH)/pixel-stuff/vendor_dlkm.modules.load))
    # BOARD_VENDOR_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
    # BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat $(DEVICE_PATH)/pixel-stuff/vendor_kernel_boot.modules.load))
    # BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
    # BOARD_HWC_VERSION := hwc3
    # BOARD_HDMI_INCAPABLE := true
    # BOARD_USES_EXYNOS_AFBC_FEATURE := true
    # BOARD_LIBACRYL_DEFAULT_COMPOSITOR := fimg2d_zuma
    # BOARD_LIBACRYL_G2D_HDR_PLUGIN := libacryl_hdr_plugin
    # BOARD_USES_HWC_SERVICES := true
    # BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
    # BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
    # BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
    # BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 2
    # BOARD_AVB_INIT_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
    # BOARD_AVB_INIT_BOOT_ALGORITHM := SHA256_RSA2048
    # BOARD_AVB_INIT_BOOT_ROLLBACK_INDEX_LOCATION := 4
    # BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
    # BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_GOOGLE_DYNAMIC_PARTITIONS_PARTITION_LIST))
    # $(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs))
    # $(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))
    # BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)
    # HWC_SUPPORT_RENDER_INTENT := true
    # HWC_SUPPORT_COLOR_TRANSFORM := true
    
    # PB_TORCH_PATH := "/sys/devices/virtual/devlink/platform:10840000.pinctrl--platform:flash@0"
    # PB_TORCH_MAX_BRIGHTNESS := 1


    # TW_OVERRIDE_SYSTEM_PROPS := "ro.bootimage.build.date.utc=ro.build.date.utc;ro.build.date.utc;ro.odm.build.date.utc=ro.build.date.utc;ro.product.build.date.utc=ro.build.date.utc;ro.system.build.date.utc=ro.build.date.utc;ro.system_ext.build.date.utc=ro.build.date.utc;ro.vendor.build.date.utc=ro.build.date.utc;ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.name=ro.product.system.name"
    # TW_INCLUDE_FUSE_NTFS := true
    # TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true

    # TW_BACKUP_EXCLUSIONS := /data/fonts
    
else
    BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
endif






