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

# dependencies
sudo $pm $pm_update
sudo $pm install gdb $clang_pack python3-pip

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
python3 -m pip install --user --upgrade pynvim
