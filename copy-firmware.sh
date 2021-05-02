#!/bin/bash

FS=msdos
DEVICE=/dev/sdf1
BIN_LOC=./.pio/build/STM32F103RC_btt_512K
MNT_LOC=/media/kwask/B075-A52B

# remounting the sd card
if [ -d $MNT_LOC ]; then
    sudo umount $MNT_LOC
    sudo rm -rf $MNT_LOC
fi
sudo mkdir $MNT_LOC
sudo mount -t $FS $DEVICE $MNT_LOC

# copy our firmware
sudo cp ${BIN_LOC}/firmware.bin ${MNT_LOC}/firmware.bin
sleep 1

# unmount
sudo umount $MNT_LOC
sleep 1
sudo rm -rf $MNT_LOC
