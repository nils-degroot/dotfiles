#!/usr/bin/env -S nu

use ~/.config/nushell/lib/ui.nu *

let windows = (
	hyprctl clients -j
		| from json
		| sort-by workspace.name title
)

let pad = (
	$windows
		| get pid
		| each { |pid| $pid | into string | str length }
		| math max
)

let selected = (
	$windows
		| each { |it| $"($it.pid | fill -a right -c ' ' -w $pad) ($it.workspace.name): ($it.title)" }
		| dmenu
)

if ( $selected | is-empty ) {
	notify-send "No entry selected"
} else {
	hyprctl dispatch focuswindow $"pid:( $selected | split words | first )"
}
