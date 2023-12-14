return function()
	require("lspsaga").setup({
		preview = {
			lines_above = 2,
			lines_below = 10,
		},
		symbol_in_winbar = {
			enable = false,
		},
		ui = {
			border = "single",
			code_action = "🦝",
		},
		lightbulb = {
			sign = false,
		},
	})
end
