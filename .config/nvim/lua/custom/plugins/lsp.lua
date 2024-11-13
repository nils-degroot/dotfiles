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
				"marksman",
			}) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			lspconfig.volar.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
			})

			lspconfig.ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/usr/lib/node_modules/@vue/typescript-plugin",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
			})

			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						schemas = {
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
							["https://moonrepo.dev/schemas/workspace.json"] = ".moon/workspace.yml",
							["https://moonrepo.dev/schemas/toolchain.json"] = ".moon/toolchain.yml",
							["https://moonrepo.dev/schemas/tasks.json"] = ".moon/tasks/**/*.yml",
							["https://moonrepo.dev/schemas/project.json"] = "moon.yml",
							["https://moonrepo.dev/schemas/template.json"] = "template.yml",
						},
					},
				},
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
		dependencies = { "nvimtools/none-ls.nvim" },
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
