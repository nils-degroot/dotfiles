vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packages
	use("wbthomason/packer.nvim")

	-- Syntax
	use("rust-lang/rust.vim")
	use({ "simrat39/rust-tools.nvim", config = require("plugins.config-rust-tools") })
	use("tbastos/vim-lua")
	use("othree/html5.vim")
	use("pangloss/vim-javascript")
	use("udalov/kotlin-vim")
	use("digitaltoad/vim-pug")
	use("purescript-contrib/purescript-vim")
	use({ "evanleck/vim-svelte", branch = "main" })
	use({ "wesleimp/stylua.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- Writing
	use({ "folke/twilight.nvim", config = require("plugins.config-twilight") })
	use({ "folke/zen-mode.nvim", config = require("plugins.config-zen") })
	use("nils-degroot/citatie")
	use({ "https://git.sr.ht/~renerocksai/telekasten.nvim", config = require("plugins.config-telekasten") })
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Menus
	use({ "lewis6991/gitsigns.nvim", config = require("plugins.config-gitsigns") })
	use({
		"feline-nvim/feline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = require("plugins.config-feline"),
	})
	use({ "kyazdani42/nvim-tree.lua", config = require("plugins.config-tree") })
	use({ "glepnir/dashboard-nvim", config = require("plugins.config-dashboard") })
	use("folke/which-key.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},
		config = require("plugins.config-telescope"),
	})

	-- Lsp
	use("neovim/nvim-lspconfig")
	use({ "quangnguyen30192/cmp-nvim-ultisnips", config = require("plugins.config-ultisnips") })
	use({
		"SirVer/ultisnips",
		requires = { { "honza/vim-snippets", rtp = "." } },
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
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = require("plugins.config-lspsaga"),
	})
	use({
		"Saecki/crates.nvim",
		config = require("plugins.config-crates"),
		requires = {
			"jose-elias-alvarez/null-ls.nvim",
		},
	})
	use("onsails/lspkind.nvim")

	-- etc
	use("tpope/vim-surround")
	use("mattn/emmet-vim")
	use("srcery-colors/srcery-vim")
	use("lewis6991/impatient.nvim")
	use("easymotion/vim-easymotion")
	use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.config-indent-blankline") })
	use("mg979/vim-visual-multi")
end)
