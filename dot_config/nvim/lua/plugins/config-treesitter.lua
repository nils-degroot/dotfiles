return function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "nu", "org" },
	})
end
