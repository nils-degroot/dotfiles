return function()
	require("zen-mode").setup({
		window = {
			backdrop = 1,
			width = 80,
			options = {
				number = false,
				relativenumber = false,
				list = false,
			},
		},
	})
end
