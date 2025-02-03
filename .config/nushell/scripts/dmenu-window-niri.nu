#!/usr/bin/env -S nu

use ~/.config/nushell/lib/ui.nu *

let windows = (
	niri msg windows
		| split row "\n\n"
		| each {
			let properties = ($in | lines | str trim | split column ": " | rename key value)
			let window_id = $properties | get 0.key | split row " " | last
			let title = $properties | get 1.value | str replace "\"" "" --all

			$"($window_id) ($title)"
		}
)

let selected = ( $windows | dmenu )

if ( $selected | is-empty ) {
	notify-send "No entry selected"
} else {
	let id = ( $selected | split row ": " | first )
	niri msg action focus-window --id $id
}
