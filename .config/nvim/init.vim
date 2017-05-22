set termguicolors
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.common_vimrc

set nohlsearch
set laststatus=1
set wildignorecase
let &colorcolumn = g:Brace_column_limit
colorscheme brace_nvim


function Initcursor()
    set guicursor=a:blinkon0-block-Cursor,i-ci:blinkon0-ver25-InsertCursor
endfunction

com Showcursor call Initcursor() |
    \ exec "highlight Cursor "g:Brace_cursor_values |
    \ normal! :redraw " needed to force cursor redraw

com Hidecursor set guicursor=a:ver1 |
    \ highlight Cursor guibg=bg |
    \ normal! :redraw " needed to force cursor redraw

call Initcursor()


com Runtests split | terminal bash runtests.bash

nnoremap <silent><leader>u :Runtests <CR>

" inoremap · (
" inoremap “ [
" inoremap ” {
" inoremap æ '
" inoremap Æ "

" <M-"> doesn't work for some reason
inoremap <M-;> "
tnoremap <C-O> <C-\><C-n>
