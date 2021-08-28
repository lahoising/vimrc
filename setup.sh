#!/bin/bash
pm=apt
pm_update=update
clang_pack=clangd

if [ -n "$(cat /etc/os-release | egrep "fedora|Fedora")" ]
then
	pm=dnf
	pm_update=check-update
	clang_pack=clang
fi

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# dotnet and mono
if [ $pm = dnf ]
then
	sudo rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
	sudo curl https://download.mono-project.com/repo/centos8-stable.repo | sudo tee /etc/yum.repos.d/mono-centos8-stable.repo
	sudo dnf update
elif [ $pm = apt ]
then
	sudo apt install gnupg ca-certificates
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
	echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

	wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
	sudo dpkg -i packages-microsoft-prod.deb
	rm packages-microsoft-prod.deb

	sudo apt-get update
	sudo apt-get install -y apt-transport-https
fi

# dependencies
sudo $pm $pm_update
sudo $pm install gdb $clang_pack python3-pip dotnet-sdk-5.0 mono-devel mono-complete

# nodejs for pyright
if [ $pm = dnf ]
then
	sudo dnf module enable nodejs:15
	sudo dnf module install nodejs:15/default
else
	curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
	sudo apt install nodejs
fi

# python lsp
sudo npm install -g npm@next pyright

# vimspector requires python
python3 -m pip install --user --upgrade pynvim neovim-remote
