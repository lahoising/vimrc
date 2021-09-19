#!/bin/bash

# vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# you complete me essentials
sudo dnf install cmake gcc-c++ make python3-devel
