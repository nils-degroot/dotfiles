#!/usr/bin/env -S nu

glob -D ~/Pictures/backgrounds/**/*
	| get (random int 0..(($in | length) - 1))
	| swaybg -i $in -m fill

