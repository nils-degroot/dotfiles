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
	{ "simrat39/rust-tools.nvim", config = true, ft = "rust" },
	{ "rust-lang/rust.vim", ft = "rust" },
	"othree/html5.vim",
	{ "tbastos/vim-lua", ft = "lua" },
	"pangloss/vim-javascript",
	"vim-scripts/liquid.vim",
	{ "imsnif/kdl.vim", ft = "kdl" },
	{ "LhKipp/nvim-nu", config = true, ft = "nu" },
	{ "aklt/plantuml-syntax", ft = "plantuml" },
	{ "evanleck/vim-svelte", ft = "svelte" },
	{ "prisma/vim-prisma", ft = "prisma" },
	"leafgarland/typescript-vim",

	-- Formatting
	{ "wesleimp/stylua.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Writing
	{ "folke/twilight.nvim", config = require("plugins.config-twilight") },
	{ "folke/zen-mode.nvim", config = require("plugins.config-zen") },
	{ "renerocksai/telekasten.nvim", config = require("plugins.config-telekasten") },
	"dhruvasagar/vim-table-mode",

	-- Ui
	{ "lewis6991/gitsigns.nvim", config = true },
	{ "folke/which-key.nvim", config = require("plugins.config-which-key") },
	{
		"feline-nvim/feline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = require("plugins.config-feline"),
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = require("plugins.config-telescope"),
	},
	{ "folke/todo-comments.nvim", config = true },
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
		config = true,
		dependencies = { "jose-elias-alvarez/null-ls.nvim" },
	},
	"onsails/lspkind.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		config = require("plugins.config-treesitter"),
		dependencies = { "nushell/tree-sitter-nu" },
	},

	-- etc
	"tpope/vim-surround",
	"mattn/emmet-vim",
	"srcery-colors/srcery-vim",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = true,
	},
	"mg979/vim-visual-multi",
	{ "echasnovski/mini.starter", branch = "stable", config = require("plugins.config-mini-starter") },
	{ "echasnovski/mini.pairs", branch = "stable", config = true },
	"David-Kunz/gen.nvim",
	{ "numToStr/Comment.nvim", config = true },
	{
		"weirongxu/plantuml-previewer.vim",
		dependencies = { "tyru/open-browser.vim" },
	},
}, {
	concurrency = 8,
})
