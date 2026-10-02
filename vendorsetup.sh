#
# OrangeFox build environment for lmi (POCO F2 Pro / Redmi K30 Pro)
# OF_* build vars live in BoardConfig.mk; only FOX_* environment vars go here.
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
    export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_BUILD_DEVICE="$FDEVICE"

    # Shell and tools
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
    export FOX_USE_FSCK_EROFS_BINARY=1

    # Features
    export FOX_ENABLE_APP_MANAGER=1
    export FOX_DELETE_AROMAFM=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1

    # Dynamic partitions
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

    # Maintainer; bump the patch version for every release of the same OrangeFox version
    export OF_MAINTAINER="ChinaDroid"
    export FOX_MAINTAINER_PATCH_VERSION=1
else
    if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
        echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
    fi
fi
