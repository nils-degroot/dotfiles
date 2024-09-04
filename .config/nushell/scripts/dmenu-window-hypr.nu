#!/usr/bin/env -S nu

use ~/.config/nushell/lib/ui.nu *

let windows = (
	hyprctl clients -j | from json | each { |it| $"($it.workspace.name): ($it.title)" }
)

let selected = ( $windows | dmenu )

if ( $selected | is-empty ) {
	notify-send "No entry selected"
} else {
	let title = ( $selected | split row ": " | get 1 )
	sh -c $"hyprctl dispatch focuswindow 'title:($title)'"
}
