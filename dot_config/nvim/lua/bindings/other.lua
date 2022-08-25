local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<Leader>tf", ":Limelight!!<CR>:Goyo<CR>", silent)
nnoremap("<Leader>fp", ":e ~/.config/nvim/lua/config.lua<CR>", silent)

nnoremap("<Leader>cc", ":noh<CR>", silent)
nnoremap("<F1>", ":execute 'silent ! alacritty &'<CR>", silent)

