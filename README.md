# OrangeFox device tree for POCO F2 Pro / Redmi K30 Pro (lmi)

Recovery device tree for building [OrangeFox Recovery](https://orangefox.tech) R12 on the `fox_16.0` manifest.

Based on [sekaiacg/android_device_xiaomi_umi_TWRP](https://github.com/sekaiacg/android_device_xiaomi_umi_TWRP) (SM8250 unified tree), reduced to lmi only.

| Device       | POCO F2 Pro / Redmi K30 Pro / Redmi K30 Pro Zoom Edition |
| -----------: | :------------------------------------------------------- |
| Codename     | lmi                                                      |
| SoC          | Qualcomm SM8250 Snapdragon 865                           |
| Partitions   | non-A/B, dedicated `recovery` (128 MB), dynamic `super`  |
| Encryption   | FBE v2 + metadata encryption, keymaster 4.1              |
| Display      | 2400 x 1080, 6.67", pop-up front camera                  |
| Shipped with | Android 10                                               |

Kernel, dtb and recovery dtbo in `prebuilt/lmi` come from the AxionOS 2.8 (20261002) `boot.img` and `dtbo.img`:
Linux 4.19.325 built from [Nyxal-GH/android_kernel_xiaomi_sm8250](https://github.com/Nyxal-GH/android_kernel_xiaomi_sm8250),
with erofs and exfat built in. The stock MIUI kernel cannot mount the erofs `vendor`/`odm` of Android 16 ROMs.

## Build

```bash
repo init -u https://gitlab.com/OrangeFox/Manifest.git -b fox_16.0 --depth=1
repo sync
git clone <this repo> -b fox_16.0 device/xiaomi/lmi

export FOX_BUILD_DEVICE=lmi
source build/envsetup.sh
lunch twrp_lmi-bp2a-eng
mka recoveryimage
```

Output: `out/target/product/lmi/recovery.img`.

Test without flashing:

```bash
fastboot boot out/target/product/lmi/recovery.img
```

## Status

Not yet built or tested on `fox_16.0`. Before release, run the full
[OrangeFox test suite](https://wiki.orangefox.tech/dev/maintainerships) against
MIUI 12/13 and Android 14, 15 and 16 custom ROMs, with decryption checked on each.
