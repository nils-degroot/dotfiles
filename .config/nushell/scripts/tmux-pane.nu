#!/usr/bin/env -S nu

let selected = ( tmux list-windows -F "#I: #W" | sk-tmux )

if ( $selected | is-empty ) {
	exit 0
}

$selected | split row ":" | get 0 | tmux select-window -t $in
