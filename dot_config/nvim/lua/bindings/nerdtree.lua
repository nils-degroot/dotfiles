local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<Leader>tt", ":NvimTreeToggle<CR>", silent)
nnoremap("<Leader>pa", ":NvimTreeRefresh<CR>", silent)
