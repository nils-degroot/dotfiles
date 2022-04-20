local g = vim.g
local go = vim.go
local wo = vim.wo

g.mapleader = " "
g.termguicolors = true

go.mouse = "a"
go.shiftwidth = 4
go.tabstop = 4

wo.number = true
wo.relativenumber = true
wo.linebreak = true

vim.opt.list = true
vim.cmd [[set listchars=space:·,tab:>·]]
