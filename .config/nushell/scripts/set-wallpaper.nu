#!/usr/bin/env -S nu

let link_path = $"($env.HOME)/.local/share/background"
let path = ( glob -D ~/Pictures/backgrounds/**/* | get (random int 0..(($in | length) - 1)) )

ln -s $path $link_path

swaybg -i $link_path -m fill
