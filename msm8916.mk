#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#ant.mk
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

#audio.mk
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    tinymix

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

#browser.mk
# Gello
PRODUCT_PACKAGES += \
    Gello

#charger.mk
# Charger
PRODUCT_PACKAGES += \
    charger_res_images

#display.mk
# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080


# Screen density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

#fingerprint.mk
# Fingerprint sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_PACKAGES += \
    fingerprint.msm8916 \
    fingerprintd


#init.mk
# Init scripts

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.class_main.sh:root/init.class_main.sh \
    $(LOCAL_PATH)/rootdir/init.mdm.sh:root/init.mdm.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.bms.sh:root/init.qcom.bms.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.factory.rc:root/init.qcom.factory.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.rc:root/:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/init.qcom.usb.sh:root/init.qcom.usb.sh \
    $(LOCAL_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \

#keylayouts.mk
# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

#lights.mk
# Lights
PRODUCT_PACKAGES += \
    lights.msm8916

#media.mk
# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml


# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.enable-player=true \
	media.stagefright.enable-http=true \
	media.stagefright.enable-aac=true \
	media.stagefright.enable-qcp=true \
	media.stagefright.enable-fma2dp=true \
	media.stagefright.enable-scan=true \
	media.msm8939hw=0 \
	media.msm8929hw=0 \
	mm.enable.smoothstreaming=true \
	mmp.enable.3g2=true \
	media.aac_51_output_enabled=true


#nfc.mk
# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    nfc_nci.bcm2079x.default \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm-20795a20.conf:system/etc/libnfc-brcm-20795a20.conf \
    $(LOCAL_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \

#partitions.mk
# Factory reset protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/config

#perf.mk
# Properties
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.dex2oat_thread_count=4
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.max_starting_bg=8 \
    ro.sys.fw.use_trim_settings=true

#qcom-audio.mk
# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.primary.msm8916 \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    av.streaming.offload.enable=true \
    audio.offload.buffer.size.kb=64 \
    audio.offload.gapless.enabled=true \
    audio.offload.min.duration.secs=30 \
    audio.offload.pcm.16bit.enable=false \
    audio.offload.pcm.24bit.enable=true \
    use.voice.path.for.pcm.voip=true

# ACDB Loader calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdbdata/MTP/MTP_Bluetooth_cal.acdb:system/etc/acdbdata/MTP/MTP_Bluetooth_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/MTP/MTP_General_cal.acdb:system/etc/acdbdata/MTP/MTP_General_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/MTP/MTP_Global_cal.acdb:system/etc/acdbdata/MTP/MTP_Global_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/MTP/MTP_Handset_cal.acdb:system/etc/acdbdata/MTP/MTP_Handset_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/MTP/MTP_Hdmi_cal.acdb:system/etc/acdbdata/MTP/MTP_Hdmi_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/MTP/MTP_Headset_cal.acdb:system/etc/acdbdata/MTP/MTP_Headset_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/MTP/MTP_Speaker_cal.acdb:system/etc/acdbdata/MTP/MTP_Speaker_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/msm8939-snd-card-skul:system/etc/acdbdata/QRD/msm8939-snd-card-skul \
	$(LOCAL_PATH)/audio/acdbdata/QRD/QRD_Bluetooth_cal.acdb:system/etc/acdbdata/QRD/QRD_Bluetooth_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/QRD_General_cal.acdb:system/etc/acdbdata/QRD/QRD_General_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/QRD_Global_cal.acdb:system/etc/acdbdata/QRD/QRD_Global_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/QRD_Handset_cal.acdb:system/etc/acdbdata/QRD/QRD_Handset_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/QRD_Hdmi_cal.acdb:system/etc/acdbdata/QRD/QRD_Hdmi_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/QRD_Headset_cal.acdb:system/etc/acdbdata/QRD/QRD_Headset_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/QRD_Speaker_cal.acdb:system/etc/acdbdata/QRD/QRD_Speaker_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Bluetooth_cal.acdb:system/etc/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Bluetooth_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_General_cal.acdb:system/etc/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_General_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Global_cal.acdb:system/etc/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Global_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Handset_cal.acdb:system/etc/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Handset_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Hdmi_cal.acdb:system/etc/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Hdmi_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Headset_cal.acdb:system/etc/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Headset_cal.acdb \
	$(LOCAL_PATH)/audio/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Speaker_cal.acdb:system/etc/acdbdata/QRD/msm8939-snd-card-skul/QRD_SKUL_Speaker_cal.acdb\
	$(LOCAL_PATH)/audio/tfa98xx/P1_SPK_0801.speaker:system/etc/tfa98xx/P1_SPK_0801.speaker \
	$(LOCAL_PATH)/audio/tfa98xx/TFA9890_N1B12_N1C3_v3.config:system/etc/tfa98xx/TFA9890_N1B12_N1C3_v3.config \
	$(LOCAL_PATH)/audio/tfa98xx/music.eq:system/etc/tfa98xx/music.eq \
	$(LOCAL_PATH)/audio/tfa98xx/speech.eq:system/etc/tfa98xx/speech.eq \
	$(LOCAL_PATH)/audio/tfa98xx/TFA9890_N1C3_2_1_1.patch:system/etc/tfa98xx/TFA9890_N1C3_2_1_1.patch \
	$(LOCAL_PATH)/audio/tfa98xx/music.preset:system/etc/tfa98xx/music.preset \
	$(LOCAL_PATH)/audio/tfa98xx/speech.preset:system/etc/tfa98xx/speech.preset \
	$(LOCAL_PATH)/audio/tfa98xx/coldboot.patch:system/etc/tfa98xx/coldboot.patch


#qcom-bluetooth.mk
# Init
PRODUCT_PACKAGES += \
    init.qcom.bt.sh

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

#qcom-camera.mk
# Camera
PRODUCT_PACKAGES += \
    camera.msm8916 \
    libstlport \
    Snap

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.cpp.duplication=false \
    persist.camera.hal.debug.mask=0 \
    persist.camera.pip.support=0

#qcom-display.mk
# Display
PRODUCT_PACKAGES += \
    copybit.msm8916 \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    libtinyxml \
    memtrack.msm8916

# Permissions
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml
endif

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.mdpcomp.idletime=600 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    debug.enable.sglscale=1

ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8916)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608
else
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609
endif
endif

#qcom-fm.mk
# FM
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

#qcom-gps.mk
# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/lowi.conf:system/etc/lowi.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf \
    $(LOCAL_PATH)/gps/xtwifi.conf:system/etc/xtwifi.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.location \
    ro.gps.agps_provider=1

#qcom-keystore.mk
# Keystore
ifneq ($(TARGET_PROVIDES_KEYMASTER),true)
PRODUCT_PACKAGES += \
    keystore.msm8916
endif

#qcom-media.mk
# Media
PRODUCT_PACKAGES += \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

ifneq ($(QCPATH),)
PRODUCT_PACKAGES += \
    libOmxVdecHevc
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs_msm8939.xml:system/etc/media_codecs.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=1 \
    vidc.enc.narrow.searchrange=1

#qcom-perf.mk
# IRQ balance
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf
endif

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8916

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8916)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.min_freq_0=800000
else
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.min_freq_0=960000 \
    ro.min_freq_4=800000
endif
endif

#qcom-radio.mk
# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.custom_ecc=1 \
    persist.radio.ecc_hard_1=998 \
    persist.radio.ecc_hard_count=1 \
    persist.radio.multisim.config=dsds \
    rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so \
    ro.telephony.default_network=9,1

# RIL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/data/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/data/qmi_config.xml:system/etc/data/qmi_config.xml \
    $(LOCAL_PATH)/configs/data/dsi_config.xml:system/etc/data/dsi_config.xml

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.qmi.adb_logmask=0 \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.telephony.call_ring.multiple=false \
    ro.use_data_netmgrd=true \
    persist.radio.sib16_support=1

# RIL
PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    librmnetctl \
    libxml2

#qcom-wifi.mk
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.disableWifiApFirmwareReload=true \
    wifi.interface=wlan0

# Wifi
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwcnss_qmi \
    wcnss_service

PRODUCT_PACKAGES += \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

#recovery.mk
# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_cm

#sensors.mk
# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:system/etc/sensors/hal.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

#touchscreen.mk
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

#usb.mk
# Init scripts
PRODUCT_PACKAGES += \
    init.qcom.usb.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

