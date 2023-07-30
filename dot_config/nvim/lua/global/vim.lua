local g = vim.g
local go = vim.go
local wo = vim.wo
local opt = vim.opt

g.mapleader = " "
g.termguicolors = true

go.mouse = "a"
go.timeoutlen = 500

wo.number = true
wo.relativenumber = true
wo.linebreak = true

opt.termguicolors = true
opt.list = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.scrolloff = 5

vim.cmd([[set listchars=space:·,tab:>·]])
