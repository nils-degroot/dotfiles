#! /usr/bin/env bash
#
# dmenu script for selecting a password
# Dependecies: [ pass, rofi, fd ]

FIND_CMD="fd . . --extension=gpg"
ROFI_CMD="rofi -dmenu -p Pass -i"

cd "$HOME/.password-store/"
result=$($FIND_CMD | sed -e 's/\.\///' -e 's/\.gpg//' | $ROFI_CMD)

if [ "$result" = "" ]; then
	notify-send "No password selected"
	exit 1
fi

pass -c "$result"
