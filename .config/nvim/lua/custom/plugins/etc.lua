return {
	{
		"srcery-colors/srcery-vim",
		config = function()
			vim.cmd([[colorscheme srcery]])
		end,
	},
	"mg979/vim-visual-multi",
	{ "echasnovski/mini.pairs", branch = "stable", opts = {} },
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"weirongxu/plantuml-previewer.vim",
		dependencies = { "tyru/open-browser.vim" },
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt" },
					markdown = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					vue = { "prettier" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					conform.format({ bufnr = args.buf })
				end,
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	"nvim-lua/plenary.nvim",
	"mrjones2014/smart-splits.nvim",
	"brooth/far.vim",
	"mechatroner/rainbow_csv",
}
