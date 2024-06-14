# Select a input from input dmenu
export def dmenu [
	# Title shown next to the search box
	--title (-t): string
	# Message below the search box
	--message (-m): string
	# Count of items to show
	--count (-c): int
]: list<string> -> string {
	let options = $in

	let title = if ($title == null) { "" } else { $"-p '($title)'" }
	let message = if ($message == null) { "" } else { $"-mesg '($message)'" }
	let count = if ($count == null) { "" } else { $"-l '($count)'" }

	$options | str join "\n" | sh -c $'rofi -dmenu -n -i ($title) ($message) ($count)'
}
