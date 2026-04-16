#!/usr/bin/env -S nu

let tile_dir = $"($env.HOME)/.config/nushell/scripts/wallpaper-tiles"
let base_dir = $"($env.HOME)/.local/share/gen-background"
let tile_path = $base_dir | path join "tile.png"
let background_path = $base_dir | path join "background.png"
mkdir $base_dir

let background = "#1c1b19"

# Select a tile pattern
let tile_options = ( ls $tile_dir | get name )
let selected_tile = $tile_options | get (random int ..(($tile_options | length) - 1))

# Find the monitor to use
let size = ( hyprctl monitors -j | from json | sort-by -r width | get 0  )

# Create a pattern
(
  magick
    $selected_tile
    -fuzz 15%
    -fill none
    -draw "alpha 0,0 floodfill"
    -background $background
    -fill $background
    -colorize 50%
    -flatten
    -gravity center
    -resize 100x100
    -extent 200x200
    $tile_path
)

# Create the bg
(
  magick
    -size $"($size.width)x($size.height)"
    $"xc:($background)"
    "(" $tile_path -write mpr:tile +delete ")"
    -fill "mpr:tile"
    -draw "color 0,0 reset"
    -compose Over
    $background_path
)

# Apply it
swaybg -i $background_path -m fill
