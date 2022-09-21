vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function ()
	-- Packages
	use "wbthomason/packer.nvim"

	-- Syntax
    use "rust-lang/rust.vim"
    use "tbastos/vim-lua"
	use "othree/html5.vim"
	use "pangloss/vim-javascript"
	use {
		"evanleck/vim-svelte",
		branch = "main"
	}

	-- Writing
    use "junegunn/limelight.vim"
    use "junegunn/goyo.vim"
    use "nils-degroot/citatie"

	-- Menus
    use "airblade/vim-gitgutter"
	use "vim-airline/vim-airline"
	use "kyazdani42/nvim-tree.lua"
    use "glepnir/dashboard-nvim"
    use "nvim-lua/plenary.nvim"
	use "kyazdani42/nvim-web-devicons"
	use "folke/which-key.nvim"
    use {
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}

	-- Coc
    use "tjdevries/coc-zsh"
    use "rafcamlet/coc-nvim-lua"
    use {
		"neoclide/coc.nvim",
		branch = "master",
		run = "yarn install --frozen-lockfile"
	}

	-- etc
	use "tpope/vim-surround"
	use "easymotion/vim-easymotion"
	use "mattn/emmet-vim"
	use "srcery-colors/srcery-vim"
	use {
		"lukas-reineke/indent-blankline.nvim",
		config = require("plugins.config-indent-blankline")
	}
end)
