" Section jumping: [[ and ]] provided by Antony Scriven <adscriven at gmail dot com>
" Copied from builtin php ftplugin file to add visual-mode mapping.
" Unlike the mappings for other modes, the visual mapping does not end with ':nohls<CR>',
" because that command doesn't work when a range is highlighted.
let s:function = '\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function'
let s:class = '\(abstract\s\+\|final\s\+\)*class'
let s:interface = 'interface'
let s:section = '\(.*\%#\)\@!\_^\s*\zs\('.s:function.'\|'.s:class.'\|'.s:interface.'\)'
exe 'vnoremap <buffer> <silent> [[ ?' . escape(s:section, '|') . '?<CR>'
exe 'vnoremap <buffer> <silent> ]] /' . escape(s:section, '|') . '/<CR>'
