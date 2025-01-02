#!/usr/bin/env -S nu

use ~/.config/nushell/lib/ui.nu *

let selected = ( tmux list-sessions | dmenu )

if ( $selected | is-empty ) {
	notify-send "No entry selected"
} else {
	let session_id = ( $selected | split row ": " | get 0 )
	alacritty -e tmux attach -d -t $session_id
}
