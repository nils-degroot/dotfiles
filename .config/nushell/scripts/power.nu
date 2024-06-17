#!/usr/bin/env -S nu

use ~/.config/nushell/lib/ui.nu *

let options = [
	{ name: "Lock" }
	{ name: "Poweroff" }
	{ name: "Reboot" }
]

match ( $options | get name | dmenu ) {
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
