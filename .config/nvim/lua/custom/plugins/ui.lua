return {
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "folke/which-key.nvim", opts = {} },
	{ "folke/todo-comments.nvim", opts = {} },
	{ "j-hui/fidget.nvim", opts = {} },
	{
		"gelguy/wilder.nvim",
		opts = {},
		config = function()
			local wilder = require("wilder")

			wilder.setup({ modes = { ":", "/", "?" } })
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer({
					highlighter = wilder.basic_highlighter(),
				})
			)
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {
				"icon",
				"mtime",
			},
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{ "dhruvasagar/vim-table-mode", ft = "markdown" },
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { "skim" },
	},
	{ "petertriho/nvim-scrollbar", opts = {} },
}
