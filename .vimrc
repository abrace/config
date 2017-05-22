source ~/.common_vimrc

set guicursor=a:blinkon0-Cursor,i-ci:blinkon0-ver25-InsertCursor

com Hidecursor highlight Cursor guifg=NONE guibg=NONE
com Showcursor exec "highlight Cursor "g:Brace_cursor_values

inoremap ¨ (
inoremap Û [
inoremap û {
inoremap § '
inoremap ¢ "
