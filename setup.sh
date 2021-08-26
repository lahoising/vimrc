#!/bin/bash
pm=apt
pm_update=update

if [ -n "$(cat /etc/os-release | egrep \"fedora|Fedora\")" ]
then
	pm=dnf
	pm_update=check-update
fi

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# nodejs for pyright
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

# dependencies
sudo $pm $pm_update
sudo $pm install gdb clangd nodejs python3-pip

# python lsp
sudo npm install -g npm@next pyright

# vimspector requires python
python3 -m pip install --user --upgrade pynvim
