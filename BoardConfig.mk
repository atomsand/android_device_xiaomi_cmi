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

# Inherit from sm8250-common
-include device/xiaomi/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/cmi
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Assert
TARGET_OTA_ASSERT_DEVICE := cmi

# Kernel
TARGET_KERNEL_CONFIG := cmi_user_defconfig

# Display
TARGET_SCREEN_DENSITY := 440

# Fingerprint
SOONG_CONFIG_XIAOMI_KONA_FOD_POS_X = 441
SOONG_CONFIG_XIAOMI_KONA_FOD_POS_Y = 1808
SOONG_CONFIG_XIAOMI_KONA_FOD_SIZE = 197

# Inherit from the proprietary version
-include vendor/xiaomi/cmi/BoardConfigVendor.mk
