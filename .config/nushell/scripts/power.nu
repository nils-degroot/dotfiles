#!/usr/bin/env -S nu

let options = [
	{ name: "Lock" }
	{ name: "Poweroff" }
	{ name: "Reboot" }
]

match ( $options | get name | str join "\n" | rofi -dmenu -n i ) {
	"Lock" => {
		swaylock -c 000000
	}
	"Poweroff" => {
		poweroff
	}
	"Reboot" => {
		reboot
	}
}
