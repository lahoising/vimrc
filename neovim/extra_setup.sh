#!/bin/bash

function isDistro
{
	res="$(cat /etc/os-release | egrep "$1")"
	if [ -n "$res" ]
	then
		echo 1
	else
		echo 0
	fi
}

pm=dnf
pm_ins=-S

packages_to_install=""

if [ $(isDistro "Manjaro") ]
then
	pm=pacman
	pm_ins=-S
	packages_to_install="clang"
fi

sudo $pm $pm_ins $packages_to_install
