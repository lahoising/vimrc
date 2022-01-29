#!/bin/bash

script_dir=${0%/*}
source "${script_dir}/../utils.sh"

function install_from_source
{
	nvim_repo_dir="./downloaded/neovim-src"
	git clone git@github.com:neovim/neovim.git "${nvim_repo_dir}"
	cd "${nvim_repo_dir}"

	nvim_out_dir=~/local/nvim
	make CMAKE_BUILD_TYPE=Release
	make CMAKE_INSTALL_PREFIX=${nvim_out_dir} install
}

if $(isDistro "Manjaro")
then
	sudo pacman -S neovim
elif $(isDistro "Ubuntu") || $(isDistro "Pop")
then
	sudo apt update
	sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl

	install_from_source
fi

