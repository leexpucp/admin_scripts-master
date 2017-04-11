#!/bin/bash
## boot_osx.sh
## This sets the default reFInd bootloader to OSX


if [[ -z "$1" ]]
then
		machines="1-14"
else
		machines=$1
fi

./run_on_machines.sh "cd /boot/efi/EFI/refind; sudo cp refind_osx.conf refind.conf" $machines

