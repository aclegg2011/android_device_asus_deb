#
# Copyright 2012 The Android Open Source Project
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
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# AEX stuff.
TARGET_BOOT_ANIMATION_RES := 1080

# Set this flag in build script
ifeq ($(CURRENT_BUILD_TYPE), gapps)
# GAPPS
WITH_GAPPS := true
TARGET_GAPPS_ARCH := arm
TARGET_MINIMAL_APPS := true
TARGET_SHIPS_SEPERATE_GAPPS_BUILD := true
#IS_PHONE := true
endif

# Inherit full common AEX stuff
$(call inherit-product, vendor/aosp/config/common.mk)
$(call inherit-product, vendor/aosp/config/aex_props.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aosp/config/telephony.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/deb/device.mk)
$(call inherit-product-if-exists, vendor/asus/deb/deb-vendor.mk)
#$(call inherit-product-if-exists, vendor/qcom/proprietary/common/config/device-vendor.mk)

PRODUCT_DEVICE := deb
PRODUCT_NAME := aosp_deb
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := asus
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=razorg \
    PRIVATE_BUILD_DESC="razorg-user 6.0.1 MOB30X 3036618 release-keys"

BUILD_FINGERPRINT := google/razorg/deb:6.0.1/MOB30X/3036618:user/release-keys
