local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<Leader>pf", ":Telescope fd<CR>", silent)
nnoremap("<Leader>pb", ":Telescope buffers<CR>", silent)

nnoremap("<Leader>gb", ":Telescope git_branches<CR>", silent)
