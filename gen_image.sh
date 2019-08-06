#!/usr/bin/env bash
dd if=/dev/zero of=512M bs=1M count=512
mkdosfs 512M
mkdir -p /mnt/dingux
mount 512M /mnt/dingux/
cp rootfs.squashfs /mnt/dingux/
mkdir /mnt/dingux/local /mnt/dingux/local/apps /mnt/dingux/local/home /mnt/dingux/local/etc
# copy some more software to /mnt/dingux/local/apps and unmount
umount /mnt/dingux/
