#!/bin/bash

if [ "$1" = "-nvim" ]
then
	echo "install vim plug for neovim"

	# vim plug - neovim
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
else
	echo "install vim plug for vim"

	# vim plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

function isDistro
{
	res=$(cat /etc/os-release | egrep "$1") 
	if [ -n "$res" ]
	then
		echo 1
		return
	fi

	echo 0
}

pm=dnf
pm_ins=install

packages_to_install="cmake gcc make"
echo $(isDistro "Manjaro")

if [ $(isDistro "Manjaro") ]
then
	echo "manjaro"
	pm=pacman
	pm_ins=-S
	packages_to_install="$packages_to_install python3"
elif [ $(isDistro "Ubuntu") ]
then
	echo "ubuntu"
	pm=apt
	packages_to_install="$packages_to_install python3-dev"
else
	echo "fedora"
	packages_to_install="$packages_to_install python3-devel"
fi

# you complete me essentials
sudo $pm $pm_ins $packages_to_install
