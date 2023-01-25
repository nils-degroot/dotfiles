-- Add additional capabilities supported by nvim-cmplsp
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs({
	"sumneko_lua",
	"rust_analyzer",
	"tsserver",
	"angularls",
	"svelte",
}) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

-- General writing lsps
for _, lsp in ipairs({
	"marksman",
	-- "grammarly",
}) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
		filetypes = { "markdown", "telekasten" },
	})
end
