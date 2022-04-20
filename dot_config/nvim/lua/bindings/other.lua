local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<F1>", ":Limelight!!<CR>:Goyo<CR>", silent)
nnoremap("<F2>", ":source /home/nils/.config/nvim/init.vim<CR>", silent)
nnoremap("<F3>", ":Citatie<CR>", silent)

nnoremap("<Leader>c", ":noh<CR>", silent)
nnoremap("<Leader>t", ":execute 'silent ! alacritty &'<CR>", silent)
