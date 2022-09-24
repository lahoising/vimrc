#!/bin/bash

function isOs {
	osname="$(uname -s)"
	correct=false

	case "${osname}" in
		Linux*)		if [ "$1" == linux ]; then correct=true; fi;;
		CYGWIN*)	if [ "$1" == windows ]; then correct=true; fi;;
		MINGW*)		if [ "$1" == windows ]; then correct=true; fi;;
		MSYS*)		if [ "$1" == windows ]; then correct=true; fi;;
	esac

	$correct
}

function isDistro {
	if  $(isOs "windows"); then 
		return $false
	fi

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

echo "$(isOs windows)"

if $(isDistro "Manjaro")
then
	pm="pacman"
	pm_ins="-S"
elif $(isDistro "Ubuntu") || $(isDistro "Pop")
then
	pm=apt
fi
