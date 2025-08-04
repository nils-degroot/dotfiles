local set = vim.api.nvim_set_keymap
local set_opts = { silent = true, noremap = true }

vim.g.rustaceanvim = {
	server = {
		default_settings = {
			["rust-analyzer"] = {
				rustc = {
					source = "discover",
				},
				cargo = {
					allFeatures = true,
				},
			},
		},
	},
}

set("n", "<Leader>ck", ":RustLsp moveItem up<CR>", set_opts)
set("n", "<Leader>cj", ":RustLsp moveItem down<CR>", set_opts)

set("n", "<Leader>se", ":RustLsp explainError<CR>", set_opts)

set("n", "<Leader>gs", ":RustLsp openDocs<CR>", set_opts)
