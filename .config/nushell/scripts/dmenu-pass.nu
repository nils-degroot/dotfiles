#!/usr/bin/env nu

use ~/.config/nushell/lib/ui.nu *

let password_dir = $"($env.HOME)/.password-store/"

let passwords = (
	glob --depth 10 $"($password_dir)**/*.gpg"
		| str replace -n $password_dir ""
		| str replace -n ".gpg" ""
		| each { |entry|
			if ($entry | str ends-with "-otp") {
				[$" otp ($entry | str replace "-otp" "")"]	
			} else if ($entry | str contains "@") {
				let entry = $entry | split row "@" | first
				[$"user ($entry)", $"pass ($entry)"]
			} else {
				[$"pass ($entry)"]
			}
		}
		| flatten
)

let selected_entry = $passwords | dmenu -t "Pass" 

if ($selected_entry | is-empty) {
	notify-send "No entry selected"
	exit 1
}

let selected = $selected_entry | str trim | split row " " | get 1

let globbed = (
	glob $"($password_dir)**/*.gpg"
		| path relative-to $password_dir
		| str replace ".gpg" ""
		| where { |entry| $entry | str contains $selected }
		| sort-by { |entry| $entry | str length } # Get the shorted match first to support suffixes
)

if ($selected_entry | str starts-with "user") {
	# Split once at @
	$globbed | first | split row "@" | skip 1 | str join "@" | wl-copy
} else if ($selected_entry | str starts-with "pass") {
	pass -c ($globbed | first)
} else if ($selected_entry | str starts-with " otp") {
	pass otp code -c ( $globbed | where { |entry| $entry | str ends-with "-otp"} | first )
}
