#!/usr/bin/env -S nu

## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */ ##
# Re-written to nu by nils-degroot
#
# Clipboard Manager. This script uses cliphist, rofi, and wl-copy.
#
# Actions:
# CTRL Del to delete an entry
# ALT Del to wipe clipboard contents

loop {
	let result = (
		cliphist list
			| rofi -dmenu -kb-custom-1 "Control-Delete" -kb-custom-2 "Alt-Delete" -config ~/.config/rofi/clipboard.rasi
			| complete
	)

	match $result.exit_code {
		1 => {
			exit
		}
		0 => {
			if $result.stdout != "" {
				$result.stdout | cliphist decode | wl-copy
				exit
			}
		}
		10 => {
            $result.stdout | cliphist delete
		}
		11 => {
			cliphist wipe
		}
	}
}
