""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Alexey Minchakov <lexaaim@ya.ru>
" Last Change:  2017 June
" License:      MIT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi clear
if exists("syntax_on")
  syntax reset
endif

" set background=dark
" set linespace=3

let g:colors_name = "my_theme"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight-groups' colors
" hi [hl-group] cterm=[bold,underline] ctermbg=[colour] ctermfg= gui= guibg= guifg=

" used for the columns set with 'colorcolumn'
hi ColorColumn      cterm=none ctermbg=1    ctermfg=0
" placeholder characters substituted for concealed
hi Conceal          cterm=none ctermbg=1    ctermfg=15
" the character under the cursor
hi Cursor           cterm=bold ctermbg=15   ctermfg=0
" like Cursor, but used when in IME mode
hi CursorIM         cterm=bold ctermbg=15   ctermfg=0
" the screen column and column that the cursor is in when 'cursorcolumn' is set
hi CursorColumn     cterm=none ctermbg=none ctermfg=none
hi CursorLine       cterm=none ctermbg=none ctermfg=none
" directory names in listings
hi Directory        cterm=none ctermbg=none ctermfg=4
" diff mode: added line, changed, deleted, changer text within a line diff.txt
hi DiffAdd          cterm=bold ctermbg=2    ctermfg=15
hi DiffChange       cterm=bold ctermbg=4    ctermfg=15
hi DiffDelete       cterm=bold ctermbg=1    ctermfg=15
hi DiffText         cterm=bold ctermbg=3    ctermfg=8
" error messages on the command line
hi ErrorMsg         cterm=none ctermbg=1    ctermfg=15
" the column separating vertically split windows
hi VertSplit        cterm=none ctermbg=none ctermfg=8
" line used for closed folds
hi Folded           cterm=none ctermbg=8    ctermfg=2
" 'foldcolumn'
hi FoldColumn       cterm=none ctermbg=8    ctermfg=2
" column where signs are displayed
hi SignColumn       cterm=none ctermbg=none ctermfg=2
" 'incsearch' highlighting: also used for replaces with ":s///c"
hi IncSearch        cterm=none ctermbg=3    ctermfg=8
" line number for :number and :# commands
hi LineNr           cterm=none ctermbg=none ctermfg=9
" like LineNr when 'cursorline' is set for the cursor line
hi CursorLineNr     cterm=bold ctermbg=3    ctermfg=0
" character under the cursor if it's a paired bracket
hi MatchParen       cterm=none ctermbg=6    ctermfg=15
" 'showmode' message (e.g. "-- INSERT --")
hi ModeMsg          cterm=bold ctermbg=none ctermfg=4
" :h more-prompt
hi MoreMsg          cterm=none ctermbg=none ctermfg=1
" symbols that do not really exist in the text
hi NonText          cterm=none ctermbg=none ctermfg=none
" filler lines (~) after the last line in the buffer
hi EndOfBuffer      cterm=none ctermbg=none ctermfg=0
" normal text
hi Normal           cterm=none ctermbg=none ctermfg=15
" popup meny: normal item, selected item, scrollbar, thumb of SB
hi Pmenu            cterm=none ctermbg=8    ctermfg=15
hi PmenuSel         cterm=none ctermbg=1    ctermfg=8
hi PmenuSbar        cterm=none ctermbg=15   ctermfg=8
hi PmenuThumb       cterm=none ctermbg=15   ctermfg=8
" 'hit-enter' prompt and yes/no questions
hi Question         cterm=none ctermbg=none ctermfg=15
" last search pattern highlighting (:h hlsearch)
" also current line hl for quickfix window
hi Search           cterm=none ctermbg=6    ctermfg=15
" meta and special keys listed with ':map'
hi SpecialKey       cterm=none ctermbg=none ctermfg=8
" word is not recognized with spellchecker
hi SpellBad         cterm=none ctermbg=1    ctermfg=15
" word should start with a capital
hi SpellCap         cterm=none ctermbg=4    ctermfg=15
" word is recognized as one is used in another region
hi SpellLocal       cterm=none ctermbg=4    ctermfg=15
" is recognized as one that is hardly ever used
hi SpellRare        cterm=none ctermbg=4    ctermfg=15
" status line of current window
hi StatusLine       cterm=none ctermbg=none ctermfg=15
" status lines of NON-current windows
hi StatusLineNC     cterm=none ctermbg=none ctermfg=8
" tab pages line, not active tab page label
hi TabLine          cterm=none ctermbg=0    ctermfg=8
" tab pages line, where there are no labels
hi TabLineFill      cterm=none ctermbg=none ctermfg=none
" tab pages line, active tab page label
hi TabLineSel       cterm=none ctermbg=3    ctermfg=0
" titles for output from ":sel all", ":autocmd" etc.
hi Title            cterm=none ctermbg=none ctermfg=4
" visual mode selection
hi Visual           cterm=none ctermbg=4    ctermfg=0
" warning messages
hi WarningMsg       cterm=bold ctermbg=1    ctermfg=0
" current match in ':h wildmenu' completion
hi WildMenu         cterm=none ctermbg=4    ctermfg=15

" also gui-only groups: WarningMsg, Menu, ScrollBar, Tooltip

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting

" 0 - black         1 - red         2 - green       3 - yellow
" 4 - blue          5 - purple      6 - bluegreen   7 - light grey
" 8 - dark grey     9 - pink        10- yellow      11- yellow
" 12- bluegreen     13- purple      14- dark green  15- white

" any comment
hi Comment          cterm=none ctermbg=none ctermfg=8

" any constant
hi Constant         cterm=none ctermbg=none ctermfg=4
" a string constant: "this is a string"
hi String           cterm=none ctermbg=none ctermfg=4
" a character constant: 'c', '\n'
hi Character        cterm=none ctermbg=none ctermfg=9
" any special symbol
hi Special          cterm=none ctermbg=none ctermfg=9
" special character in a constant
hi SpecialChar      cterm=none ctermbg=none ctermfg=9
" a boolean constant: TRUE, false
hi Boolean          cterm=none ctermbg=none ctermfg=3
" a number constant: 234, 0xff
hi Number           cterm=none ctermbg=none ctermfg=4
" a floating point constant: 2.3e10
hi Float            cterm=none ctermbg=none ctermfg=4

" any variable name
hi Identifier       cterm=none ctermbg=none ctermfg=15
" function name
hi Function         cterm=none ctermbg=none ctermfg=3

" any statement
hi Statement        cterm=none ctermbg=none ctermfg=3
" if then else endif switch etc.
hi Conditional      cterm=none ctermbg=none ctermfg=3
" for do while
hi Repeat           cterm=none ctermbg=none ctermfg=3
" case, default, etc.
hi Label            cterm=none ctermbg=none ctermfg=3
" sizeof, operator, etc.
hi Operator         cterm=none ctermbg=none ctermfg=3
" any other keywords
hi Keyword          cterm=none ctermbg=none ctermfg=3
" try, catch, throw
hi Exception        cterm=none ctermbg=none ctermfg=3

" generic Preprocessor, #include, #define
hi PreProc          cterm=none ctermbg=none ctermfg=9
hi Include          cterm=none ctermbg=none ctermfg=9
hi Define           cterm=none ctermbg=none ctermfg=9
" same as define
hi Macro            cterm=none ctermbg=none ctermfg=9
" preprocessor #if, #else, #endif, etc.
hi PreCondit        cterm=none ctermbg=none ctermfg=9

" int, long, char, etc.
hi Type             cterm=none ctermbg=none ctermfg=3
" static, register, volatile, etc.
hi StorageClass     cterm=none ctermbg=none ctermfg=3
" struct, union, unim, etc.
hi Structure        cterm=none ctermbg=none ctermfg=3
" a typedef
hi Typedef          cterm=none ctermbg=none ctermfg=3

" you can use CTRL-] on this
hi Tag              cterm=none ctermbg=none ctermfg=5
" character that needs attention
hi Delimiter        cterm=none ctermbg=none ctermfg=14
" special things inside a comment
hi SpecialComment   cterm=none ctermbg=none ctermfg=8
"  debugging statements
hi Debug            cterm=none ctermbg=none ctermfg=8

" text that stands out, HTML links
hi Underlined  cterm=underline ctermbg=none ctermfg=4

" left blank, hidden ':h hl-Ignore'
hi Ignore           cterm=none ctermbg=none ctermfg=8

" eny erroneous construct
hi Error            cterm=none ctermbg=173  ctermfg=15

" anything that needs extra atterntion: TODO, FIXME and XXX
hi Todo             cterm=none ctermbg=8    ctermfg=0

