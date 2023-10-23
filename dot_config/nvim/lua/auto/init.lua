local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
	pattern = "*.lua",
	callback = function()
		require("stylua").format()
	end,
})

autocmd("FileType", {
	pattern = { "markdown", "telekasten", "nix", "json", "typescript", "javascript", "svelte", "prisma" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})
