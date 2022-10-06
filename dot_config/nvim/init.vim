" Invoke lua config
lua require("config")

augroup telekasten
	autocmd!

	autocmd FileType telekasten hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline
	autocmd FileType telekasten hi tkBrackets ctermfg=gray guifg=gray
	autocmd FileType telekasten hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold guibg=yellow guifg=darkred gui=bold
	autocmd FileType telekasten hi tkTagSep ctermfg=gray guifg=gray
	autocmd FileType telekasten hi tkTag ctermfg=175 guifg=#d3869B
	autocmd FileType telekasten hi link CalNavi CalRuler
augroup END
