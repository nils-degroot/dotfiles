return {
	{ "lewis6991/gitsigns.nvim", opts = {} },
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
			local notify = require("notify")
			vim.notify = notify

			notify.setup({ render = "compact", timeout = 2000, stages = "static" })
		end,
	},
	{ "dhruvasagar/vim-table-mode", ft = "markdown" },
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			"skim",
			grep = {
				rg_opts = "--sort-files --hidden --column --line-number --no-heading --color=always --smart-case -g '!{.git,node_modules,target}/*'",
			},
		},
	},
	{ "petertriho/nvim-scrollbar", opts = {} },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"sindrets/diffview.nvim",
		opts = {
			view = {
				merge_tool = {
					layout = "diff3_mixed",
				},
			},
		},
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local startify = require("alpha.themes.startify")
			startify.file_icons.provider = "devicons"
			require("alpha").setup(startify.config)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"dylanaraps/wal.vim",
		config = function()
			vim.cmd([[colorscheme wal]])
		end,
	},
}
