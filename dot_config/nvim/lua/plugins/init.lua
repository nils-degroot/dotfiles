vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packages
	use("wbthomason/packer.nvim")

	-- Syntax
	use("rust-lang/rust.vim")
	use("tbastos/vim-lua")
	use("othree/html5.vim")
	use("pangloss/vim-javascript")
	use("udalov/kotlin-vim")
	use("purescript-contrib/purescript-vim")
	use("digitaltoad/vim-pug")
	use({ "evanleck/vim-svelte", branch = "main" })
	use({ "wesleimp/stylua.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-- Writing
	use({ "folke/twilight.nvim", config = require("plugins.config-twilight") })
	use({ "folke/zen-mode.nvim", config = require("plugins.config-zen") })
	use("nils-degroot/citatie")
	use("https://git.sr.ht/~renerocksai/telekasten.nvim")
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
	use("glepnir/dashboard-nvim")
	use("folke/which-key.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},
	})

	-- Lsp
	use("neovim/nvim-lspconfig")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = require("plugins.config-lspsaga"),
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
	use("L3MON4D3/LuaSnip")
	use({ "Saecki/crates.nvim", config = require("plugins.config-crates") })

	-- etc
	use("tpope/vim-surround")
	use("mattn/emmet-vim")
	use("srcery-colors/srcery-vim")
	use("lewis6991/impatient.nvim")
	use({ "phaazon/hop.nvim", config = require("plugins.config-hop") })
	use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.config-indent-blankline") })
	use("~/Documents/code/lua/cmp-templates.nvim")
end)
