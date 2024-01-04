return function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "vim", "javascript", "typescript", "svelte", "markdown", "markdown_inline" },
	})
end
