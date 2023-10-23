return function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "vim", "javascript", "typescript", "svelte" },
	})
end
