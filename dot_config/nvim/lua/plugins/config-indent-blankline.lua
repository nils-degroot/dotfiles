return function()
	require("indent_blankline").setup {
		show_end_of_line = true,
		space_char_blankline = " ",
		filetype_exclude = {
			"dashboard"
		},
	}
end
