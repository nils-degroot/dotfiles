return {
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{
		"folke/which-key.nvim",
		opts = {
			window = {
				border = "single",
			},
			disable = {
				filetypes = { "TelescopePrompt", "dashboard" },
			},
		},
	},
	{ "folke/todo-comments.nvim", opts = {} },
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
}