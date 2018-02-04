#!/usr/bin/env bash

function run {
	if ! pgrep $1 ;
	then
		$@&
	fi
}

run parcellite
run dropbox
run setxkbmap -layout "us,el" -option "grp:alt_shift_toggle"
