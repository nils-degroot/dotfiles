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
			winopts = {
				border = "single",
				preview = {
					border = "single",
				},
			},
			grep = {
				rg_opts = "--sort-files --hidden --column --line-number --no-heading --color=always --smart-case -g '!{.git,node_modules,target,.jj}/*'",
			},
			files = {
				previewer = "bat",
				fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude .jj --exclude target]],
			},
		},
	},
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
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"srcery-colors/srcery-vim",
		config = function()
			vim.cmd([[colorscheme srcery]])
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }

			require("ibl").setup({ scope = { highlight = highlight } })

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
}
