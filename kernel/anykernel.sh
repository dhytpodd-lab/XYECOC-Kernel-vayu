### XYECOC Kernel KSUN Edition
### Device: Poco X3 Pro / vayu / bhima
### Author: @Danik_4el_2w
### Installer: AnyKernel3
### Status: TEMPLATE — add compiled kernel image before flashing.

### AnyKernel setup
properties() { '
kernel.string=XYECOC Kernel KSUN Edition for Poco X3 Pro by @Danik_4el_2w
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=1
device.name1=vayu
device.name2=bhima
device.name3=
device.name4=
device.name5=
supported.versions=11 - 16
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### Boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

### Boot shell variables
# Poco X3 Pro can be handled by partition-name autodetection in AnyKernel3.
# IS_SLOT_DEVICE=auto keeps this safer across A-only/A/B style recoveries.
BLOCK=boot;
IS_SLOT_DEVICE=auto;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

### Import AnyKernel3 core. Do not remove.
. tools/ak3-core.sh;

ui_print " ";
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━";
ui_print " XYECOC Kernel KSUN Edition";
ui_print " Device : Poco X3 Pro / vayu / bhima";
ui_print " Author : @Danik_4el_2w";
ui_print " Root   : KernelSU Next / KSUN target";
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━";
ui_print " ";

# Safety guard: never flash a template without a real kernel image.
if [ ! -f "$AKHOME/Image.gz-dtb" ] && [ ! -f "$AKHOME/Image.gz" ] && [ ! -f "$AKHOME/Image" ]; then
  abort "ERROR: Kernel image is missing. Add compiled Image.gz-dtb / Image.gz / Image to ZIP root before flashing.";
fi;

# Warn if the uploaded reference LKM is present. It is not installed automatically.
if [ -f "$AKHOME/extras/ksun_lkm_reference/android16-6.12_kernelsu.ko" ]; then
  ui_print "Note: android16-6.12_kernelsu.ko is included only as reference.";
  ui_print "It is NOT installed because it must match the exact running kernel.";
  ui_print " ";
fi;

### Boot install
# dump_boot unpacks the current boot image and preserves the existing ramdisk.
dump_boot;

# No ramdisk modifications are applied in this template.
# KernelSU Next / KSUN should be integrated into the kernel source and compiled into the final Image.

write_boot;

ui_print " ";
ui_print "XYECOC Kernel installation finished.";
ui_print "If boot fails, restore the previous boot.img from recovery/fastboot.";
ui_print " ";
## end boot install
