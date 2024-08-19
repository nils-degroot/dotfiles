return {
	{
		"srcery-colors/srcery-vim",
		config = function()
			vim.cmd([[colorscheme srcery]])
		end,
	},
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
	{
		"mrjones2014/smart-splits.nvim",
		opts = {},
		config = function()
			vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
			vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
			vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
			vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
			-- moving between splits
			vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
			vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
			vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
			vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
			vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
			-- swapping buffers between windows
			vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
			vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
			vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
			vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
		end,
	},
}
