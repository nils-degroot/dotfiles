#!/usr/bin/env -S nu --stdin

let default_player = { name: player }

def battery_widget []: nothing -> record {
	let precentage = ( 
		acpi | split row " " | get 3 | str replace "%," "" | str trim 
	)

	let icon = match ( $precentage | into int ) {
		..20 => ""
		..30 => ""
		..40 => ""
		..80 => ""
		..100 => ""
	}

	{
		name: "battery"
		full_text: $" ($icon)  ($precentage)% "
		background: "#0aaeb3"
		separator: false
	}
}

def player_widget []: nothing -> record {
	let player_status = ( playerctl status | complete ) 

	if $player_status.exit_code == 1 {
		return $default_player
	} 

	let player_meta = ( 
		playerctl metadata | detect columns -n -c 2.. | rename player key value 
	)

	let title = ( $player_meta | where key =~ "title" and value != "" )

	if ( $title | is-empty ) {
		return $default_player
	}

	let player_icon = match ($player_status.stdout | str trim) {
		"Playing" => "󰐊"
		"Paused" => ""
	}

	let artist = ( $player_meta | where key =~ "artist" and value != "" )

	let text = if ( $artist | is-empty ) {
		$' ( $player_icon ) ( $title.0.value ) '
	} else {
		$' ( $player_icon ) ( $artist.0.value ) - (  $title.0.value ) '
	}

	{
		name: "player"
		full_text: $text
		background: '#e02c6d'
		separator: false
	}
}

def disk_widget []: nothing -> record {
	{
		name: "disk"
		full_text: $" 󱛟 ( df -h / | detect columns | get 0.Use% ) "
		background: "#2c78bf"
		separator: false
	}
}

def clock_widget []: nothing -> record {
	{
		name: "clock"
		full_text: $' 󰥔 ( date now | format date "%Y-%m-%d %H:%M:%S" ) '
		background: "#519f50"
	}
}

print $"( { version: 1, click_event: false } | to json -r )\n[\n[]"

loop {
	print ,(
		[
			( battery_widget )
			( player_widget )
			( disk_widget )
			( clock_widget )
		] | to json -r
	)

	sleep 1sec
}

print "]"
