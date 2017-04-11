#!/bin/bash
## boot_ubuntu.sh
## This sets the default reFInd bootloader to Ubuntu

if [[ -z "$1" ]]
then
		machines="1-14"
else
		machines=$1
fi

./run_on_machines.sh "cd /boot/efi/EFI/refind; sudo cp refind_ubuntu.conf refind.conf" $machines
