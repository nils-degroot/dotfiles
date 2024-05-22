local set = vim.api.nvim_set_keymap
local silent_noremap = { silent = true, noremap = true }

set("n", "<Leader>ck", ":RustLsp moveItem up<CR>", silent_noremap)
set("n", "<Leader>cj", ":RustLsp moveItem down<CR>", silent_noremap)
