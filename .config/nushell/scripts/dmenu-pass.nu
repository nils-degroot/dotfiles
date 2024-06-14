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

let selected_password = ( $passwords | dmenu -t "Pass" )

if ($selected_password | is-empty) { exit }

if ($selected_password | str contains "@") {
	let selected_option = (
		$options | dmenu -t "Action" -m $"<b>Password</b>: ($selected_password)" -c 2
	)

	if ($selected_option == $username_option) {
		let seperator_position = ( $selected_password | str index-of "@" )
		let username = ( $selected_password | str substring ( $seperator_position + 1 ).. )

		$username | wl-copy
		exit
	}
}

pass -c $selected_password
