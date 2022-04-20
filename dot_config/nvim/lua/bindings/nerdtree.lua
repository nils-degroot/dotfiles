local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<F9>", ":NvimTree<CR>", silent)
nnoremap("<F10>", ":NvimTreeToggle<CR>", silent)
nnoremap("<F11>", ":NvimTreeRefresh<CR>", silent)
