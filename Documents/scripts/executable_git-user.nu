#!/usr/bin/env nu

let users = [
	[ "Cloudflight", "Nils de Groot", "nils.degroot@cloudflight.io" ],
	[ "Private" "nils-degroot", "nils@peeko.nl" ]
]

let current = $"Current: (git config --global user.name) &lt;(git config --global user.email)&gt;"

let selected = (
	$users 
		| each {|it| $it.0} 
		| str join "\n" 
		| rofi -dmenu -i -p "Set git user" -mesg $current
)

let data = ($users | filter {|it| $it.0 == $selected })
if ($data | is-empty) {
	exit
}

let data = ($data | first)
git config --global --replace-all user.name $data.1
git config --global --replace-all user.email $data.2
