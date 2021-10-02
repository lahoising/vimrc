#!/bin/bash

script_dir=${0%/*}
source "$script_dir/../utils.sh"

# vim plug - neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

packages_to_install=""

if $(isDistro "Manjaro")
then
	packages_to_install="clang python-pip" 
elif $(isDistro "Ubuntu")
then
	packages_to_install="clangd python3-pip"
	sudo apt update
fi

sudo $pm $pm_ins $packages_to_install

python3 -m pip install --user --upgrade pynvim
