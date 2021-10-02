#!/bin/bash

script_dir=${0%/*}
source $script_dir/utils.sh

packages_to_install="cmake gcc make"

if $(isDistro "Manjaro")
then
	echo "manjaro"
	packages_to_install="$packages_to_install python3"
elif $(isDistro "Ubuntu")
then
	echo "ubuntu"
	packages_to_install="$packages_to_install python3-dev"
	sudo apt update
else
	echo "fedora"
	packages_to_install="$packages_to_install python3-devel"
fi

# you complete me essentials
sudo $pm $pm_ins $packages_to_install
