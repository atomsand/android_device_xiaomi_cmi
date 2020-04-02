#
# Copyright (C) 2020 The MoKee Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from cmi device
$(call inherit-product, device/xiaomi/cmi/device.mk)

# Inherit some common MoKee stuff.
$(call inherit-product, vendor/mokee/config/common_full_phone.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.mk.maintainer=atomsand

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := mokee_cmi
PRODUCT_DEVICE := cmi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Mi 10 Pro
PRODUCT_MANUFACTURER := Xiaomi

BUILD_FINGERPRINT := "Xiaomi/cmi/cmi:10/QKQ1.191117.002/V11.0.2.0.QJACNXM:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="cmi-user 10 QKQ1.191117.002 V11.0.2.0.QJACNXM release-keys" \
    PRODUCT_NAME="cmi" \
    TARGET_DEVICE="cmi"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
