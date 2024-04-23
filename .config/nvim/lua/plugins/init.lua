local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Syntax
	{ "mrcjkb/rustaceanvim", ft = "rust" },
	{ "rust-lang/rust.vim", ft = "rust" },
	{ "tbastos/vim-lua", ft = "lua" },
	{ "imsnif/kdl.vim", ft = "kdl" },
	{ "LhKipp/nvim-nu", opts = {} },
	{ "aklt/plantuml-syntax", ft = "plantuml" },
	{ "evanleck/vim-svelte", ft = "svelte" },
	{ "prisma/vim-prisma", ft = "prisma" },
	"othree/html5.vim",
	"pangloss/vim-javascript",
	"leafgarland/typescript-vim",

	-- Writing
	{ "dhruvasagar/vim-table-mode", ft = "markdown" },

	-- Ui
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{ "folke/which-key.nvim", config = require("plugins.config-which-key") },
	{
		"feline-nvim/feline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = require("plugins.config-feline"),
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("plugins.config-telescope"),
	},
	{ "folke/todo-comments.nvim", opts = {} },
	{ "stevearc/oil.nvim", config = require("plugins.config-oil") },
	"rcarriga/nvim-notify",
	"nvim-telescope/telescope-ui-select.nvim",

	-- Lsp
	{ "williamboman/mason.nvim", config = require("plugins.config-mason") },
	"neovim/nvim-lspconfig",
	{ "quangnguyen30192/cmp-nvim-ultisnips", config = require("plugins.config-ultisnips") },
	"SirVer/ultisnips",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
		},
		config = require("plugins.config-cmp"),
	},
	{
		"nvimdev/lspsaga.nvim",
		branch = "main",
		config = require("plugins.config-lspsaga"),
	},
	{
		"Saecki/crates.nvim",
		ft = "toml",
		opts = {},
		dependencies = { "jose-elias-alvarez/null-ls.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = require("plugins.config-treesitter"),
	},

	-- etc
	"tpope/vim-surround",
	"srcery-colors/srcery-vim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	"mg979/vim-visual-multi",
	{ "echasnovski/mini.starter", branch = "stable", config = require("plugins.config-mini-starter") },
	{ "echasnovski/mini.pairs", branch = "stable", opts = {} },
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"weirongxu/plantuml-previewer.vim",
		dependencies = { "tyru/open-browser.vim" },
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		config = require("plugins.config-obsidian"),
	},
	{
		"stevearc/conform.nvim",
		config = require("plugins.config-conform"),
	},
}, {
	concurrency = 8,
})
