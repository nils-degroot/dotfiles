#!/usr/bin/env -S nu --stdin

def player_widget []: nothing -> record {
	let player_status = ( playerctl status | complete ) 

	if $player_status.exit_code == 1 {
		return { name: "player" }
	} 

	let player_meta = ( 
		playerctl metadata | detect columns -n -c 2.. | rename player key value 
	)

	if ( $player_meta | where key =~ "title" | is-empty ) {
		return { name: "player" }
	}

	let player_icon = match ($player_status.stdout | str trim) {
		"Playing" => "󰐊"
		"Paused" => ""
	}

	{
		name: "player"
		full_text: $' ( $player_icon ) ( $player_meta | where key =~ "artist" | get 0.value ) - ( $player_meta | where key =~ "title" | get 0.value ) '
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
			( player_widget )
			( disk_widget )
			( clock_widget )
		] | to json -r
	)

	sleep 1sec
}

print "]"
