local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<CR>", ":CocFix<CR>", silent)

nnoremap("gd", ":call CocAction('jumpDefinition')<CR>")
nnoremap("gi", ":call CocAction('jumpImplementation')<CR>")
nnoremap("gr", ":call CocAction('jumpReferences')<CR>")

nnoremap("sd", ":call CocAction('definitionHover')<CR>")
