" Vim colorscheme template file
" Author: Gerardo Galindez <gerardo.galindez@gmail.com>
" Maintainer: Gerardo Galindez <gerardo.galindez@gmail.com>
" Notes: To check the meaning of the highlight groups, :help 'highlight'

" --------------------------------
set background=dark
" - or ---------------------------
"set background=light
" --------------------------------

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="ngc224colorscheme"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=46    ctermbg=none    cterm=none
" Cursor doesn't do anything on xterm
hi Cursor          ctermfg=none    ctermbg=none    cterm=none
hi CursorLine      ctermfg=none    ctermbg=none    cterm=none
hi LineNr          ctermfg=94    ctermbg=none    cterm=none
hi CursorLineNR    ctermfg=none    ctermbg=none    cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
hi Folded          ctermfg=none    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=none    ctermbg=none    cterm=none
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=none    ctermbg=none    cterm=none
hi TabLineFill     ctermfg=none    ctermbg=none    cterm=none
hi TabLineSel      ctermfg=none    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=4    ctermbg=none    cterm=bold
hi Search          ctermfg=16    ctermbg=41    cterm=none
hi IncSearch       ctermfg=16    ctermbg=45    cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=16    ctermbg=none    cterm=none
hi StatusLineNC    ctermfg=none    ctermbg=none    cterm=none
hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
hi Question        ctermfg=none    ctermbg=none    cterm=none
hi Title           ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg         ctermfg=16    ctermbg=none    cterm=none
hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=16    ctermbg=250    cterm=none
hi Visual          ctermfg=16    ctermbg=58    cterm=none
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
hi NonText         ctermfg=none    ctermbg=none    cterm=none

hi Todo            ctermfg=6    ctermbg=none    cterm=bold
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=none    ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=16    ctermbg=164    cterm=none
hi WarningMsg      ctermfg=none    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=5    ctermbg=none    cterm=bold
hi link String Constant
hi StringDelimiter ctermfg=none    ctermbg=none    cterm=none
hi link Character String
hi link Number Constant
hi link Boolean Constant
hi link Float Number

hi Identifier      ctermfg=none    ctermbg=none    cterm=none
hi Function        ctermfg=6    ctermbg=none    cterm=bold

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=3    ctermbg=none    cterm=bold
hi link Conditional Statement
hi link Repeat Statement
hi Label           ctermfg=none    ctermbg=none    cterm=none
hi link Operator Statement
hi link Keyword Statement
hi link Exception Statement
hi Comment         ctermfg=240    ctermbg=none    cterm=none

hi Special         ctermfg=1    ctermbg=none    cterm=bold
hi link SpecialChar Special
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
hi link SpecialComment Special
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=2    ctermbg=none    cterm=bold
hi Include         ctermfg=4    ctermbg=none    cterm=bold
hi link Define Include
hi link Macro Define
hi PreCondit       ctermfg=none    ctermbg=none    cterm=none

hi Type            ctermfg=none    ctermbg=none    cterm=none
hi StorageClass    ctermfg=none    ctermbg=none    cterm=none
hi Structure       ctermfg=2    ctermbg=none    cterm=bold
hi Typedef         ctermfg=12    ctermbg=none    cterm=bold

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=16    ctermbg=2    cterm=none
hi DiffChange      ctermfg=16    ctermbg=5    cterm=none
hi DiffDelete      ctermfg=16    ctermbg=1    cterm=none
hi DiffText        ctermfg=16    ctermbg=3    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=16    ctermbg=6    cterm=none
hi PmenuSel        ctermfg=16    ctermbg=1    cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=none    ctermbg=none    cterm=none
hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
