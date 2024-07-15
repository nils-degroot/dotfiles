return {
	"srcery-colors/srcery-vim",
	"mg979/vim-visual-multi",
	{
		"echasnovski/mini.starter",
		branch = "stable",
		config = function()
			local starter = require("mini.starter")

			starter.setup({
				header = "",
				items = {
					starter.sections.recent_files(10, false),
					starter.sections.builtin_actions(),
				},
				footer = "",
			})
		end,
	},
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
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	"nvim-lua/plenary.nvim",
	"github/copilot.vim",
}
