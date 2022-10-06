return function()
	require("zen-mode").setup({
		window = {
			backdrop = 1,
			width = 81,
			options = {
				number = false,
				relativenumber = false,
				list = false,
			},
		},
		plugins = {
			twilight = {
				enabled = true,
			},
			gitsigns = {
				enabled = true,
			},
		},
	})
end
