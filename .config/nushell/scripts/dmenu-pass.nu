#!/usr/bin/env nu

use ~/.config/nushell/lib/ui.nu *

let username_option = "Username (by seperator)"
let password_option = "Password"

let options = [ $username_option $password_option ]

let passwords = (
	glob --depth 10 /home/nils/.password-store/**/*.gpg
		| str replace -n "/home/nils/.password-store/" ""
		| str replace -n ".gpg" ""
)

let selected_entry = ( $passwords | dmenu -t "Pass" )

if ($selected_entry | is-empty) { exit }

if ($selected_entry | str contains "@") {
	let selected_option = (
		$options | dmenu -t "Action"
	)

	if ($selected_option == $username_option) {
		let seperator_position = ( $selected_entry | str index-of "@" )
		let username = ( $selected_entry | str substring ( $seperator_position + 1 ).. )

		$username | wl-copy
		exit
	}
} else if ($selected_entry | str contains "-otp") {
	pass otp code -c $selected_entry
	exit
}

pass -c $selected_entry
