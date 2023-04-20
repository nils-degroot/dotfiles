#!/usr/bin/env nu

def join_option [option] {
	$option.icon + " " + $option.text
}

let options = [
	{ icon: "", text: "Lock screen", command: "lock" },
	{ icon: "", text: "Reboot", command: "reboot" },
	{ icon: "", text: "Poweroff", command: "poweroff" },
]

let user_option = ($options | each { |it| join_option $it } | str join "\n" | rofi -dmenu -i -p "Power menu")
if ($user_option | is-empty) {
	exit
}

sh -c ($options | filter { |it| $user_option == (join_option $it) }).command
