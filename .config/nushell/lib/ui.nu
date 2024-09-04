# Select a input from input dmenu
export def dmenu [
	# Title shown next to the search box
	--title (-t): string
	# Count of items to show
	--count (-c): int
]: list<string> -> string {
	let options = $in

	let title = if ($title == null) { "" } else { $"-p '($title)'" }
	let count = if ($count == null) { "" } else { $"-L '($count)'" }

	$options | str join "\n" | sh -c $'wofi --show dmenu -I -i ($title) ($count)'
}
