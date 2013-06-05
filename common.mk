#
# Copyright (C) 2013 The CyanogenMod Project
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

COMMON_PATH := device/samsung/omap4-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Omap4 Packages
PRODUCT_PACKAGES += \
	libedid \
	libion_ti \
    libstagefrighthw \
    smc_pa_ctrl \
    tf_daemon

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    libtinyalsa \
    libaudioutils \
    libnetcmdiface \
    tinyplay \
    tinycap \
    tinymix

# Filesystem management tools
PRODUCT_PACKAGES += \
    static_busybox \
    make_ext4fs \
    setup_fs

PRODUCT_PROPERTY_OVERRIDES += \
    com.ti.omap_enhancement=true \
    omap.enhancement=true \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)

# Include non-opensource parts if available
$(call inherit-product-if-exists, vendor/samsung/omap4-common/common-vendor.mk)
