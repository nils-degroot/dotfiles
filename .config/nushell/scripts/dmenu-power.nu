#!/usr/bin/env nu

use ~/.config/nushell/lib/ui.nu *

def join_option [option] {
	$option.icon + " " + $option.text
}

let options = [
	{ icon: "", text: "Lock screen", command: "dm-tool lock" },
	{ icon: "", text: "Reboot", command: "reboot" },
	{ icon: "", text: "Poweroff", command: "poweroff" },
]

let user_option = ($options | each { |it| join_option $it } | dmenu -t "Power menu")

if ($user_option | is-empty) {
	exit
}

sh -c ($options | where $user_option == (join_option $it)).0.command
