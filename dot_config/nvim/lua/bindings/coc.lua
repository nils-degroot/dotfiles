local util = require("bindings.util")

local nnoremap = util.nnoremap
local silent = util.silent

nnoremap("<CR>", "<Plug>(coc-fix-current)", silent)

nnoremap("<Leader>gd", ":call CocAction('jumpDefinition')<CR>")
nnoremap("<Leader>gi", ":call CocAction('jumpImplementation')<CR>")
nnoremap("<Leader>gr", ":call CocAction('jumpReferences')<CR>")

nnoremap("<Leader>sd", ":call CocAction('definitionHover')<CR>")

nnoremap("<Leader>cr", "<Plug>(coc-rename)")
