#!/usr/bin/env nu

def copy []: any -> nothing {
	let input = $in

	match ( hostname ) {
		"nils-laptop" => ( wl-copy $input )
		"station" => ( wl-copy $input )
		"nils-work" => ( $input | xclip -sel clipboard )
	}
}

let username_option = "Username (by seperator)"
let password_option = "Password"

let seperator = "@"
let options = [ $username_option $password_option ]

let passwords = (
	fd . ~/.password-store --extension=gpg 
		| lines 
		| each { 
			|it| $it 
				| str replace -n "/home/nils/.password-store/" "" 
				| str replace -n ".gpg" "" 
		}
)

let selected_password = ( $passwords | str join "\n" | rofi -dmenu -n -i -p "Pass" )

if ($selected_password | is-empty) {
	exit
} else if ($selected_password | str contains $seperator) {
	let selected_option = ( 
		$options 
			| str join "\n" 
			| rofi -dmenu -n -i -p "Action" -mesg $"<b>Password</b>: ($selected_password)" -l 2 
	)

	if ($selected_option == $username_option) {
		let seperator_position = ( $selected_password | str index-of $seperator )
		let username = ( $selected_password | str substring ( $seperator_position + 1 ).. )

		$username | copy
		exit
	}
}

pass -c $selected_password
