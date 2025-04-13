#!/usr/bin/env -S nu

use ~/.config/nushell/lib/ui.nu *

let bookmarks_file = $"($env.HOME)/Nextcloud/Config/bookmarks.json"

def main [] {
	print "Bookmarks"
}

# Open the selected bookmark
def "main open" [] {
	let bookmarks = ( open $bookmarks_file )

	let selected = (
		$bookmarks | enumerate | each { |in| $"($in.index) - ($in.item.name)" } | dmenu -t "Bookmarks"
	)

	let index = ( $selected | split words | first | into int )
	let entry = ( $bookmarks | get $index )

	xdg-open $entry.link
}

# Append a link to the bookmark list
def "main add" [name: string, link: string] {
	open $bookmarks_file
		| append { name: $name, link: $link }
		| to json
		| save -f $bookmarks_file
}
