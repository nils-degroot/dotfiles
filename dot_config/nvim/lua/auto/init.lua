-- Sets a autocmd for the given hook
--
-- @param action Action to listen to
-- @param file File filter to use
-- @param command Command to fire
local function autocmd(action, file, command)
	vim.cmd("autocmd " .. action .. " " .. file .. " " .. command)
end

-- Colorscheme
autocmd("vimenter", "*", "++nested colorscheme srcery")

-- stylua
autocmd("BufWritePre", "*.lua", ":silent lua require('stylua').format()")

-- Md
autocmd(
	"vimenter",
	"FileType telekasten",
	"hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold"
)
autocmd("vimenter", "FileType telekasten", "hi tkBrackets ctermfg=gray guifg=gray")
autocmd("vimenter", "FileType telekasten", "hi tkLink ctermfg=Blue cterm=bold,underline guifg=blue gui=bold,underline")
autocmd("vimenter", "FileType telekasten", "hi tkTag ctermfg=175 guifg=#d3869B")
