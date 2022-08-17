" Invoke lua config
lua require("config")

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
