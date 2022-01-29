#!/bin/bash

function isDistro
{
	res=$(cat /etc/os-release | egrep "$1") 
	if [ -n "$res" ]
	then
		true
	else
		false
	fi
}

pm=dnf
pm_ins=install

if $(isDistro "Manjaro")
then
	pm="pacman"
	pm_ins="-S"
elif $(isDistro "Ubuntu") || $(isDistro "Pop")
then
	pm=apt
fi
