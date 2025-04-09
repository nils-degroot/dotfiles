#!/usr/bin/env -S nu

let screenshot_dir = $"($env.HOME)/Pictures"

def main [ ] {
	print "Screenshot"
}

def "main full" [ ] {
	let output_path = $"($screenshot_dir)/(date now | format date "%Y-%m-%d-%Hh%Mm%Ss.png")"
	grim -t png $output_path
	notify-send "Screenshot taken" $"Stored it at ($output_path)" -i $output_path
}

def "main region" [ ] {
	let output_path = $"($screenshot_dir)/(date now | format date "%Y-%m-%d-%Hh%Mm%Ss.png")"
	grim -g (slurp) -t png $output_path
	notify-send "Screenshot taken" $"Stored it at ($output_path)" -i $output_path
}
