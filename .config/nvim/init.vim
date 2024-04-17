" Invoke lua config
lua require("config")

if has('persistent_undo')
    let target_path = expand('~/.local/share/vim-undo')
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif

    let &undodir = target_path
    set undofile
endif

" Add custom snippets to rtp
set runtimepath+=~/Documents/code/vim/vim-snippets/

colorscheme srcery
