#!/bin/bash

script_dir="${BASH_SOURCE%/*}"
source "$script_dir/../utils.sh"

# vim plug - neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

packages_to_install=""

if $(isDistro "Manjaro")
then
	packages_to_install="clang python-pip" 
elif $(isDistro "Ubuntu") || $(isDistro "Pop")
then
	if [ -z "$(which dotnet)" ]
	then
		wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
		sudo dpkg -i packages-microsoft-prod.deb
		rm packages-microsoft-prod.deb
	fi

	sudo apt update
	sudo apt install -y apt-transport-https gnupg ca-certificates

	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
	echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

	packages_to_install="clangd python3-pip dotnet-sdk-5.0 mono-devel mono-complete mono-dbg snapd"
	sudo apt update
fi

sudo $pm $pm_ins $packages_to_install
sudo snap install --classic node
sudo npm install -g pyright
python3 -m pip install --user --upgrade pynvim

# omnisharp-roslyn
omnisharp_out_tar="omnisharp.tar.gz"
curl -L https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.37.16/omnisharp-mono.tar.gz -o "${omnisharp_out_tar}"
omni_bin_dir=~/.omnisharp
mkdir -p "${omni_bin_dir}"
rm -rf "${omni_bin_dir}/*"
tar -xvf "${omnisharp_out_tar}" -C "${omni_bin_dir}"
rm "${omnisharp_out_tar}"
