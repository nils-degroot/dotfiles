local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<Leader>tf", ":Limelight!!<CR>:Goyo<CR>", silent)
nnoremap("<F2>", ":source /home/nils/.config/nvim/init.vim<CR>", silent)

nnoremap("<Leader>cc", ":noh<CR>", silent)
nnoremap("<F1>", ":execute 'silent ! alacritty &'<CR>", silent)
