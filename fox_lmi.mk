#
# OrangeFox Recovery - fox_lmi.mk for lmi (Redmi K30 Pro / POCO F2 Pro)
# OrangeFox-specific Makefile variables (inherited via inherit-product-if-exists)
#

# OrangeFox-specific settings
OF_USE_GREEN_LED := 0
OF_DONT_PATCH_ENCRYPTED_DEVICE := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_NO_MIUI_PATCH_WARNING := 1

OF_ENABLE_LPTOOLS := 1
OF_QUICK_BACKUP_LIST := /boot;/data;

# avb 2.0
OF_PATCH_AVB20 := 1

# OTA
OF_KEEP_DM_VERITY := 1
OF_SUPPORT_ALL_BLOCK_OTA_UPDATES := 1
OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR := 1
OF_DISABLE_MIUI_OTA_BY_DEFAULT := 1

# try to prevent potential data format errors
OF_UNBIND_SDCARD_F2FS := 1

# maximum permissible splash image size (in kilobytes); do *NOT* increase!
OF_SPLASH_MAX_SIZE := 130

# screen settings
OF_SCREEN_H := 2400
OF_STATUS_H := 80
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_CLOCK_POS := 1

# number of list options before scrollbar creation
OF_OPTIONS_LIST_NUM := 9

# build all the partition tools
OF_ENABLE_ALL_PARTITION_TOOLS := 1

# we need lzma because of the sizes of ramdisks produced by 14.1
OF_USE_LZMA_COMPRESSION := 1

# use dmctl in the data formatting process
OF_USE_DMCTL := 1

# don't keep log history - only use for Stable releases
ifeq ($(FOX_BUILD_TYPE),Stable)
   OF_DONT_KEEP_LOG_HISTORY := 1
endif
#
