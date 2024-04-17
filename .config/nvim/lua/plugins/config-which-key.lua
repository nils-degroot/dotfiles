return function()
	require("which-key").setup({
		window = {
			border = "single",
		},
		disable = {
			filetypes = { "TelescopePrompt", "dashboard" },
		},
	})
end
