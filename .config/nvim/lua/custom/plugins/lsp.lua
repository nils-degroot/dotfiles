return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Lsp config
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
			for _, lsp in ipairs({
				"lua_ls",
				"tsserver",
				"astro",
			}) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			lspconfig.marksman.setup({
				capabilities = capabilities,
				filetypes = { "markdown", "telekasten" },
			})

			vim.lsp.inlay_hint.enable()
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		branch = "main",
		opts = {
			preview = {
				lines_above = 2,
				lines_below = 10,
			},
			symbol_in_winbar = {
				enable = false,
			},
			ui = {
				border = "single",
				code_action = "🦝",
			},
			lightbulb = {
				sign = false,
			},
		},
	},
	{
		"Saecki/crates.nvim",
		ft = "toml",
		opts = {},
		dependencies = { "jose-elias-alvarez/null-ls.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"javascript",
					"typescript",
					"svelte",
					"markdown",
					"markdown_inline",
					"bash",
					"regex",
				},
			})
		end,
	},
}
