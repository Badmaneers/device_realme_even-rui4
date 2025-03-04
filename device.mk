#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/even

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/realme/even/even-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# RealmeParts
$(call inherit-product, packages/apps/RealmeParts/parts.mk)

# The first api level, device has been commercially launched on.
PRODUCT_SHIPPING_API_LEVEL := 30

# Extra VNDK Versions
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# InCall Service
PRODUCT_PACKAGES += \
    MtkInCallService

# KPOC
PRODUCT_PACKAGES += \
    libsuspend

# Boot Animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# RCS 
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss@1.0.vendor \
    android.hardware.gnss@1.1.vendor \
    android.hardware.gnss@2.0.vendor \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss-V1-ndk.vendor

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6768:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6768

# Init
PRODUCT_PACKAGES += \
    init.recovery.mt6768.rc \
    init.mt6768.rc \
    fstab.mt6768

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.even
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Runtime Resource Overlays 
PRODUCT_PACKAGES += \
    SettingsOverlayRMX3430 \
    TetheringConfigOverlay \
    WifiOverlay

# System prop
-include $(DEVICE_PATH)/system_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.even

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml
