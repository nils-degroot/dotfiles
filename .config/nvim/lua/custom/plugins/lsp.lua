return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Lsp config
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for type in { "eslint", "lua_ls", "marksman", "somesass_ls" } do
				lspconfig[type].setup({
					capabilities = capabilities,
				})
			end

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "~/.local/share/pnpm/global/5/node_modules/@vue/typescript-plugin/",
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
			vim.diagnostic.config({ virtual_text = true })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})
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
		dependencies = {
			{ "nushell/tree-sitter-nu" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"javascript",
					"typescript",
					"markdown",
					"markdown_inline",
					"bash",
					"regex",
					"nu",
					"rust",
					"hurl",
				},
				highlight = {
					enable = true,
				},
			})
		end,
		build = ":TSUpdate",
	},
}
