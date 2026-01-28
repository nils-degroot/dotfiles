#!/usr/bin/env -S nu

let link_path = $"($env.HOME)/.local/share/background"
let path = ( fd -t f . ~/Pictures/backgrounds/ | lines | get (random int 0..(($in | length) - 1)) )

ln -sf $path $link_path
swaybg -i $link_path -m fill
