" Based on:
"
" MacVim colorscheme
"
" Maintainer:   Bjorn Winckler <bjorn.winckler@gmail.com>
" Last Change:  2008 May 9
"
" This is the default MacVim color scheme.  It supports both light and dark
" backgrounds (see :h 'background').
"


highlight clear

" Reset String -> Constant links etc if they were reset
if exists("syntax_on")
  syntax reset
endif

" let colors_name = "macvim"
let colors_name = "brace"


"
" First list all groups common to both 'light' and 'dark' background.
"

" `:he highlight-groups`
hi DiffAdd      guibg=MediumSeaGreen
hi Directory    guifg=#1600FF
hi ErrorMsg     guibg=Firebrick2 guifg=White
hi FoldColumn   guibg=bg guifg=DarkBlue
"hi Folded       guibg=#E6E6E6 guifg=DarkBlue
hi Folded       guibg=#E6E6E6 guifg=Gray40
hi IncSearch    gui=reverse
hi ModeMsg      gui=bold
hi MoreMsg      gui=bold guifg=SeaGreen4
hi NonText      gui=bold guifg=Blue
hi Pmenu        guibg=LightSteelBlue1
hi PmenuSbar    guibg=Grey
hi PmenuSel     guifg=White guibg=SkyBlue4
hi PmenuThumb   gui=reverse
hi Question     gui=bold guifg=Chartreuse4
hi SignColumn   guibg=Grey guifg=DarkBlue
hi SpecialKey   guifg=Blue
hi SpellBad     guisp=Firebrick2 gui=undercurl
hi SpellCap     guisp=Blue gui=undercurl
hi SpellLocal   guisp=DarkCyan gui=undercurl
hi SpellRare    guisp=Magenta gui=undercurl
hi StatusLine   gui=NONE guifg=White guibg=DarkSlateGray
"hi StatusLine   gui=NONE guifg=White guibg=Gray50
hi StatusLineNC gui=NONE guifg=SlateGray guibg=Gray90
hi TabLineSel   gui=NONE guibg=Gray90
hi TabLine      gui=NONE guibg=Gray80
hi TabLineFill  guifg=Gray80
hi Title        gui=bold guifg=DeepSkyBlue3
hi VertSplit    gui=NONE guifg=DarkSlateGray guibg=Gray90
if has("gui_macvim")
  hi Visual       guibg=MacSelectedTextBackgroundColor
else
  hi Visual       guibg=#72F7FF
endif
hi WarningMsg   guifg=Firebrick2

" Syntax items (`:he group-name` -- more groups are available, these are just
" the top level syntax items for now).
"hi Error        gui=NONE guifg=White guibg=Firebrick3
hi Error        gui=NONE guifg=fg guibg=bg
hi Identifier   gui=NONE guifg=fg guibg=bg
hi Ignore       gui=NONE guifg=fg guibg=bg
hi PreProc      gui=NONE guifg=fg guibg=bg
hi Special      gui=NONE guifg=fg guibg=bg
hi String       gui=NONE guifg=coral4 guibg=NONE
hi Underlined   gui=NONE guifg=fg guibg=bg
""hi phpStringSingle gui=NONE guifg=red  "contents of string
hi Delimiter gui=NONE guifg=gray45    "parens, braces..

hi QuickFixLine guibg=LightGoldenrodYellow

if exists('g:Brace_colorcolumn_values')
    exec 'hi ColorColumn ' g:Brace_colorcolumn_values
endif

"
" Groups that differ between 'light' and 'dark' background.
"

  "hi Boolean      gui=NONE guifg=MidnightBlue guibg=bg
  hi Boolean      gui=NONE guifg=fg guibg=bg
  "hi Comment      gui=italic guifg=SeaGreen guibg=NONE
  hi Comment      guifg=SkyBlue3 guibg=NONE
  "hi Constant     gui=NONE guifg=MidnightBlue guibg=bg
  hi Constant     gui=NONE guifg=fg guibg=bg
  " hi Cursor       guibg=gray50 guifg=white
  if exists('g:Brace_initial_cursor_values')
      exec 'hi Cursor  ' g:Brace_initial_cursor_values
  endif
  hi InsertCursor guibg=fg guifg=bg
  hi CursorColumn guibg=#F1F5FA
  hi CursorIM     guibg=fg guifg=bg
  hi CursorLine   guibg=#F1F5FA
  hi DiffChange   guibg=DeepSkyBlue
  hi DiffDelete   gui=bold guifg=Black guibg=SlateBlue
  hi DiffText     gui=NONE guibg=Gold
  hi LineNr       guifg=#888888 guibg=#E6E6E6
  "hi MatchParen   guifg=White guibg=MediumPurple1
  hi MatchParen   guifg=Black guibg=#D5DFA9

  if has("gui_macvim")
    hi Normal       gui=NONE guifg=MacTextColor guibg=MacTextBackgroundColor
  else
    hi Normal       gui=NONE guifg=Black guibg=White
  endif

  "hi Search       guibg=CadetBlue1 guifg=NONE
  hi Search       guibg=PaleGoldenrod guifg=NONE
  "hi Statement    gui=NONE guifg=MidnightBlue guibg=bg    "$, if, return...
  hi Statement    gui=NONE guifg=fg guibg=bg    "$, if, return...
  hi Todo         gui=NONE guifg=fg guibg=bg
  "hi Type         gui=NONE guifg=MidnightBlue guibg=bg   "self, array, ->, ...
  hi Type         gui=NONE guifg=fg guibg=bg   "self, array, ->, ...
  hi WildMenu     guibg=SkyBlue guifg=Black
  hi lCursor      guibg=fg guifg=bg


"
" Change the selection color on focus change (but only if the "macvim"
" colorscheme is active).
"
if has("gui_macvim") && !exists("s:augroups_defined")
  au FocusLost * if exists("colors_name") && colors_name == "macvim" | hi Visual guibg=MacSecondarySelectedControlColor | endif
  au FocusGained * if exists("colors_name") && colors_name == "macvim" | hi Visual guibg=MacSelectedTextBackgroundColor | endif

  let s:augroups_defined = 1
endif
