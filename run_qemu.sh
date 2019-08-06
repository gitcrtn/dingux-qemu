#!/usr/bin/env bash

MACHINE="-M malta -m 256"
FIRMWARE="-kernel vmlinux -hda 512M"
HARDWARE="-sdl -soundhw ac97 -k en-us -rtc clock=vm"
NETWORK="-net nic,model=e1000,netdev=guest0 -netdev tap,id=guest0,ifname=vtap0"
SERIAL="-serial stdio -monitor none"

qemu-system-mipsel $MACHINE $FIRMWARE $HARDWARE $NETWORK $SERIAL
