-- Add additional capabilities supported by nvim-cmplsp
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs({
	"sumneko_lua",
	"rust_analyzer",
	"kotlin_language_server",
	"purescriptls",
	"tsserver",
}) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

lspconfig.marksman.setup({
	capabilities = capabilities,
	filetypes = { "markdown", "telekasten" },
})
