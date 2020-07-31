" use silver searcher ag (1) as external grep program
" copied from "man 1 ag"
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m


" grep through currently open file
"command! -nargs=1 Bufgrep silent execute 'grep! <q-args> ' . shellescape(expand('%')) | botright copen
command! -nargs=1 Bufgrep
            \  silent execute "grep! "
            \  . shellescape(expand('<args>')) . ' ' . shellescape(expand('%'))
            \  | botright copen
nnoremap <leader>/ :Bufgrep<Space>

" search word under the cursor in current file
command! -nargs=0 Stargrep
            \  silent execute "grep! " .
            \  shellescape(expand('<cword>')) . ' ' . shellescape(expand('%'))
            \  | botright copen
nnoremap <leader>* :Stargrep<CR>

" search and display quickfix window
" TODO consider escaping
command! -nargs=+ Ag silent grep! <args> | botright copen


"function! DoGrep(pattern, where)
"    silent execute "grep! " . a:pattern . " " . a:where
"    " open in full widow width if multiple splits open
"    botright copen
"    " global <CR> mapping gets in the way here
"    "nnoremap <buffer> <CR> <CR>
"endfunction
"
"" grep through currently open file
""command! -nargs=1 Bufgrep silent grep! <args> % | botright copen | unmap <buffer> <CR>
"command! -nargs=1 Bufgrep call DoGrep(<q-args>, expand('%'))
"nnoremap <leader>gr :Bufgrep<Space>
"
"" search word under the cursor in current buffer
"command! -nargs=0 Stargrep call DoGrep(expand('<cword>'), expand('%'))
"nnoremap <leader>* :Stargrep<CR>
"
"" search at current working directory
"command! -nargs=+ Ag call DoGrep(<q-args>, '.')
"nnoremap <leader>gr :Ag<Space>
