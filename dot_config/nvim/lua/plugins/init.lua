vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packages
	use("wbthomason/packer.nvim")

	-- Syntax
	use({ "simrat39/rust-tools.nvim", config = require("plugins.config-rust-tools") })
	use("rust-lang/rust.vim")
	use("othree/html5.vim")
	use("tbastos/vim-lua")
	use("pangloss/vim-javascript")
	use("vim-scripts/liquid.vim")
	use("imsnif/kdl.vim")
	use({ "LhKipp/nvim-nu", config = require("plugins.config-nu") })
	use("aklt/plantuml-syntax")
	use({ "nvim-orgmode/orgmode", config = require("plugins.config-orgmode") })
	use("udalov/kotlin-vim")

	-- Formatting
	use({ "wesleimp/stylua.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- Writing
	use({ "folke/twilight.nvim", config = require("plugins.config-twilight") })
	use({ "folke/zen-mode.nvim", config = require("plugins.config-zen") })
	use({ "renerocksai/telekasten.nvim", config = require("plugins.config-telekasten") })
	use("dhruvasagar/vim-table-mode")

	-- Ui
	use({ "lewis6991/gitsigns.nvim", config = require("plugins.config-gitsigns") })
	use({ "folke/which-key.nvim", config = require("plugins.config-which-key") })
	use({
		"feline-nvim/feline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = require("plugins.config-feline"),
	})
	use({ "ahmedkhalf/project.nvim", config = require("plugins.config-project") })
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
		config = require("plugins.config-telescope"),
	})
	use({ "folke/todo-comments.nvim", config = require("plugins.config-todo-comments") })
	use({ "jghauser/fold-cycle.nvim", config = require("plugins.config-fold-cycle") })
	use({ "stevearc/oil.nvim", config = require("plugins.config-oil") })
	use({ "stevearc/dressing.nvim" })
	use({ "rcarriga/nvim-notify" })

	-- Lsp
	use({ "williamboman/mason.nvim", config = require("plugins.config-mason") })
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use({ "quangnguyen30192/cmp-nvim-ultisnips", config = require("plugins.config-ultisnips") })
	use({
		"SirVer/ultisnips",
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
			vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
			vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
			vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
			vim.g.UltiSnipsRemoveSelectModeMappings = 0
		end,
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip",
		},
		config = require("plugins.config-cmp"),
	})
	use({
		"nvimdev/lspsaga.nvim",
		branch = "main",
		config = require("plugins.config-lspsaga"),
	})
	use({
		"Saecki/crates.nvim",
		config = require("plugins.config-crates"),
		requires = { "jose-elias-alvarez/null-ls.nvim" },
	})
	use("onsails/lspkind.nvim")
	use("nvim-treesitter/nvim-treesitter")

	-- etc
	use("tpope/vim-surround")
	use("mattn/emmet-vim")
	use("srcery-colors/srcery-vim")
	use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.config-indent-blankline") })
	use("mg979/vim-visual-multi")
	use({ "ggandor/leap.nvim", config = require("plugins.config-leap") })
	use({ "echasnovski/mini.starter", branch = "stable", config = require("plugins.config-mini-starter") })
	use({ "echasnovski/mini.cursorword", branch = "stable", config = require("plugins.config-mini-cursorword") })
	use({ "echasnovski/mini.pairs", branch = "stable", config = require("plugins.config-mini-pairs") })
end)
