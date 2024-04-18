local autocmd = vim.api.nvim_create_autocmd
local conform = require("conform")

autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		conform.format({ bufnr = args.buf })
	end,
})

-- 2 indent files
autocmd("FileType", {
	pattern = { "markdown", "telekasten", "nix", "json", "typescript", "javascript", "svelte", "prisma" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- Highlighted yank
autocmd("TextYankPost", {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 500,
		})
	end,
})

-- Nushell highlight
autocmd("FileType", {
	pattern = { "nu" },
	callback = function()
		vim.cmd("TSEnable highlight")
	end,
})
