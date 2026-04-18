#
# OrangeFox Recovery - vendorsetup.sh for lmi (Redmi K30 Pro)
# Based on sekaiacg (skkk) TWRP device tree, adapted for OrangeFox R12
#

FDEVICE="lmi"

fox_get_target_device() {
    local chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
    if [ -n "$chkdev" ]; then
        FOX_BUILD_DEVICE="$FDEVICE"
    else
        chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
        [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
    fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

    # === basic settings ===
    export TW_DEFAULT_LANGUAGE="zh_CN"
    export LC_ALL="C"
    export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_BUILD_DEVICE="$FDEVICE"

    # === prebuilt kernel ===
    export OF_FORCE_PREBUILT_KERNEL=1

    # === decryption ===
    export OF_DEFAULT_KEYMASTER_VERSION=4.1
    export OF_USE_NEW_VOLD_ON_METADATA_DECRYPT=1

    # === MIUI / AVB ===
    export OF_PATCH_AVB20=1

    # === screen layout ===
    # lmi: 6.67" 2400x1080 (20:9), pop-up front camera (no notch)
    export OF_SCREEN_H=2400
    export OF_STATUS_H=80
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_ALLOW_DISABLE_NAVBAR=0

    # === timezone ===
    export OF_DEFAULT_TIMEZONE="CST-8"

    # === shell and tools ===
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_USE_LZ4_BINARY=1
    export FOX_USE_ZSTD_BINARY=1
    export FOX_USE_DATE_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_GREP_BINARY=1
    export FOX_USE_NANO_EDITOR=1

    # === OrangeFox features ===
    export FOX_ENABLE_APP_MANAGER=1
    export FOX_DELETE_AROMAFM=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export OF_ENABLE_ALL_PARTITION_TOOLS=1

    # === compression (128MB recovery partition, plenty of space) ===
    export OF_USE_LZMA_COMPRESSION=1

    # === maintainer ===
    export OF_MAINTAINER="ChinaDroid"
    export FOX_MAINTAINER_PATCH_VERSION="1"

    # === ccache ===
    export USE_CCACHE=1
    export CCACHE_EXEC=/usr/bin/ccache

    # === backup list ===
    export OF_QUICK_BACKUP_LIST="/data;/boot;"

    # === partition paths (lmi dynamic partitions) ===
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

    # === erofs support ===
    export FOX_USE_FSCK_EROFS_BINARY=1

else
    if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
        echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
    fi
fi
