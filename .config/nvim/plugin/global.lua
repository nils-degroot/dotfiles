local g = vim.g
local go = vim.go
local wo = vim.wo
local opt = vim.opt

g.mapleader = " "

go.timeoutlen = 500

wo.number = true
wo.relativenumber = true
wo.linebreak = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.scrolloff = 5
opt.conceallevel = 1
opt.termguicolors = true
opt.inccommand = "split"

opt.list = true
opt.listchars = {
	tab = "·┈",
	trail = "￮",
	multispace = "￮",
	lead = " ",
	extends = "▶",
	precedes = "◀",
	nbsp = "‿",
}

vim.loader.enable()
