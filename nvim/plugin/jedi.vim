set rtp^=/usr/share/vim/vimfiles/after

autocmd Filetype python setlocal omnifunc=jedi#completions
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_select_first = 0
let g:jedi#completions_command = "<C-N>"
