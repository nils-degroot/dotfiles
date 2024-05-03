#!/usr/bin/env -S nu

let windows = (
	swaymsg -t get_tree | from json | get nodes.nodes | flatten | get nodes | flatten
)

let windows = [
	...($windows | where layout == "none")
	...($windows | where layout != "none" | get nodes | flatten)
]

let selected = (
	 $windows 
	 	| each { |it| $"($it.id) - ($it.name)" } 
		| str join "\n" 
		| rofi -dmenu -i
)

if ( $selected | is-empty ) {
	notify-send "No entry selected"
} else {
	let id = ( $selected | split row " " | first )
	sh -c $"swaymsg [con_id=($id)] focus"
}
