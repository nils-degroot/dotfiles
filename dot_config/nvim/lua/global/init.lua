-- Vim config
local g = vim.g
local go = vim.go
local wo = vim.wo
local opt = vim.opt

g.mapleader = " "

go.mouse = "a"
go.timeoutlen = 500

wo.number = true
wo.relativenumber = true
wo.linebreak = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.scrolloff = 5

vim.loader.enable()

-- rust.vim config
vim.g.rustfmt_autosave = 1

-- Lsp config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Notify
vim.notify = require("notify")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs({
	"lua_ls",
	"rust_analyzer",
	"svelte",
	"jdtls",
	"tsserver",
	"prismals",
}) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

lspconfig.marksman.setup({
	capabilities = capabilities,
	filetypes = { "markdown", "telekasten" },
})

lspconfig.grammarly.setup({
	capabilities = capabilities,
	filetypes = { "markdown", "telekasten", "org", "norg" },
})

lspconfig.eslint.setup({
	--- ...
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})
