local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<C-p>", ":Telescope fd<CR>", silent)
nnoremap("<C-b>", ":Telescope buffers<CR>", silent)
