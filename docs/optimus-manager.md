# Setup Nvidia GPU

## Manjaro/ArchLinux

**DON'T USE AUTO INSTALL DRIVERS FOR MANJARO `mhwd` utilities**


This docs aims to explain how to setup a discrete Nvidia GPU with optimus-manager and how to configure properly th epower management.

(https://github.com/Askannz/optimus-manager)[https://github.com/Askannz/optimus-manager]


One can add someting like this to the `/etc/grub.d/40_custom` file.
(the model can be found in `/boot/grub/grub.cfg`)


```bash
#!/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.
menuentry 'Manjaro Linux (Nvidia)' --class manjaro --class gnu-linux --class gnu --class os $menuentry_id_option 'gnulinux-simple-f17dbb25-0346-47df-8aaf-1efa2e878b6f' {
	savedefault
	load_video
	set gfxpayload=keep
	insmod gzio
	insmod part_gpt
	insmod ext2
	set root='hd0,gpt6'
	if [ x$feature_platform_search_hint = xy ]; then
	  search --no-floppy --fs-uuid --set=root --hint-ieee1275='ieee1275//disk@0,gpt6' --hint-bios=hd0,gpt6 --hint-efi=hd0,gpt6 --hint-baremetal=ahci0,gpt6  f17dbb25-0346-47df-8aaf-1efa2e878b6f
	else
	  search --no-floppy --fs-uuid --set=root f17dbb25-0346-47df-8aaf-1efa2e878b6f
	fi
	linux	/boot/vmlinuz-5.9-x86_64 root=UUID=f17dbb25-0346-47df-8aaf-1efa2e878b6f rw  apparmor=1 security=apparmor udev.log_priority=3 optimus-manager.startup=nvidia
	initrd	/boot/intel-ucode.img /boot/initramfs-5.9-x86_64.img
}
```

To test the power use of the laptop, you can try:
 * `powertop`
 * `cpu-power`


## Ubuntu

`optimus-manager` is only for arch base distributions. For Ubuntu, use `ubuntu-drivers` utilities instead.

## Debian

For now you're rekt. The Nvidia GPU full support will be available on Debian 11.