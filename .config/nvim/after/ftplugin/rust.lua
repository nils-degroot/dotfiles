local set = vim.api.nvim_set_keymap
local set_opts = { silent = true, noremap = true }

set("n", "<Leader>ck", ":RustLsp moveItem up<CR>", set_opts)
set("n", "<Leader>cj", ":RustLsp moveItem down<CR>", set_opts)

set("n", "<Leader>se", ":RustLsp explainError<CR>", set_opts)

set("n", "<Leader>gs", ":RustLsp openDocs<CR>", set_opts)
