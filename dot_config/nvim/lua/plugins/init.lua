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
	use({
		"evanleck/vim-svelte",
		branch = "main",
	})
	use({
		"wesleimp/stylua.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Writing
	use("junegunn/limelight.vim")
	use("junegunn/goyo.vim")
	use("nils-degroot/citatie")

	-- Menus
	use("airblade/vim-gitgutter")
	use("vim-airline/vim-airline")
	use("kyazdani42/nvim-tree.lua")
	use("glepnir/dashboard-nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("folke/which-key.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
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
			"saadparwaiz1/cmp_luasnip",
		},
	})
	use("L3MON4D3/LuaSnip")

	-- etc
	use("tpope/vim-surround")
	use("easymotion/vim-easymotion")
	use("mattn/emmet-vim")
	use("srcery-colors/srcery-vim")
	use("lewis6991/impatient.nvim")
	use("editorconfig/editorconfig-vim")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = require("plugins.config-indent-blankline"),
	})

	-- Custom
	use("~/Documents/code/lua/confirm.nvim")
end)
