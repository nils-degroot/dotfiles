-- Vim config
local g = vim.g
local go = vim.go
local wo = vim.wo
local opt = vim.opt

g.mapleader = " "
g.termguicolors = true

go.mouse = "a"
go.timeoutlen = 500

wo.number = true
wo.relativenumber = true
wo.linebreak = true

opt.termguicolors = true
opt.list = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.scrolloff = 5

vim.cmd([[set listchars=space:·,tab:>·]])

-- rust.vim config
vim.g.rustfmt_autosave = 1

-- Lsp config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs({
	"lua_ls",
	"rust_analyzer",
	"svelte",
	"denols",
}) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

lspconfig.tsserver.setup({
	capabilities = capabilities,
	single_file_support = false,
	root_pattern = { "tsconfig.json" },
})

-- General writing lsps
for _, lsp in ipairs({
	"marksman",
	"grammarly",
}) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
		filetypes = { "markdown", "telekasten" },
	})
end
