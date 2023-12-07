local autocmd = vim.api.nvim_create_autocmd

-- Stylua
autocmd("BufWritePre", {
	pattern = "*.lua",
	callback = function()
		require("stylua").format()
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

-- Telekasten colors
autocmd("FileType", {
	pattern = { "telekasten" },
	callback = function()
		vim.api.nvim_set_hl(0, "tklink", {
			ctermfg = 72,
			fg = "#689d6a",
			bold = true,
			underline = true,
		})

		vim.api.nvim_set_hl(0, "tkBrackets", {
			ctermfg = "gray",
			fg = "gray",
		})

		vim.api.nvim_set_hl(0, "tkHighlight", {
			ctermbg = "yellow",
			ctermfg = "darkred",
			bg = "yellow",
			fg = "darkred",
			bold = true,
		})

		vim.api.nvim_set_hl(0, "tkTagSep", {
			ctermfg = "gray",
			fg = "gray",
		})

		vim.api.nvim_set_hl(0, "tkTag", {
			ctermfg = 175,
			fg = "#d3869B",
		})

		vim.api.nvim_set_hl(0, "link", {
			ctermfg = 175,
			fg = "#d3869B",
		})
	end,
})
