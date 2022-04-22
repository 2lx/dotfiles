""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Alexey Minchakov <lexaaim@ya.ru>
" Last Change:  2022 April
" License:      MIT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "my_theme_light"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax highlighting
" 0 - black          8 - dark grey
" 1 - red            9 - bright red / pink
" 2 - green         10 - bright green
" 3 - yellow        11 - bright yellow
" 4 - blue          12 - bright blue
" 5 - magenta       13 - bright magenta
" 6 - bluegreen     14 - cyan
" 7 - light grey    15 - white
"
" hi [hl-group] cterm=[none,bold,underline,uncercurl,inverse,
"     italic,standout,nocombine,strikethrough,attr-list]
"   ctermbg= ctermfg= gui= guibg= guifg=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help highlight-groups

" used for the columns set with 'colorcolumn'
hi ColorColumn      cterm=none      ctermbg=7    ctermfg=0

" placeholder characters substituted for concealed text
" (see 'conceallevel')
hi Conceal          cterm=none      ctermbg=1    ctermfg=5

" the character under the cursor
hi Cursor           cterm=bold      ctermbg=15   ctermfg=0

" the character under the cursor when |language-mapping|
" is used (see 'guicursor')
hi lCursor          cterm=bold      ctermbg=15   ctermfg=0

" like Cursor, but used when in IME mode |CursorIM|
hi CursorIM         cterm=bold      ctermbg=15   ctermfg=0

" the screen column that the cursor is in when 'cursorcolumn' is set
hi CursorColumn     cterm=none      ctermbg=none ctermfg=none

" the screen line that the cursor is in when 'cursorline' is set
hi CursorLine       cterm=none      ctermbg=none ctermfg=none

" directory names (and other special names in listings)
hi Directory        cterm=bold      ctermbg=none ctermfg=4

" diff mode: Added line |diff.txt|
hi DiffAdd          cterm=bold      ctermbg=none ctermfg=2

" diff mode: Changed line |diff.txt|
hi DiffChange       cterm=bold      ctermbg=none ctermfg=3

" diff mode: Deleted line |diff.txt|
hi DiffDelete       cterm=bold      ctermbg=none ctermfg=1

" diff mode: Changed text within a changed line |diff.txt|
hi DiffText         cterm=bold      ctermbg=none ctermfg=3

" filler lines (~) after the last line in the buffer.
" By default, this is highlighted like |hl-NonText|
hi EndOfBuffer      cterm=none      ctermbg=none ctermfg=15

" error messages on the command line
hi ErrorMsg         cterm=none      ctermbg=9    ctermfg=0

" the column separating vertically split windows
hi VertSplit        cterm=none      ctermbg=7    ctermfg=none

" line used for closed folds
hi Folded           cterm=none      ctermbg=15   ctermfg=6

" 'foldcolumn'
hi FoldColumn       cterm=none      ctermbg=15   ctermfg=6

" column where |signs| are displayed
hi SignColumn       cterm=none      ctermbg=none ctermfg=2

" 'incsearch' highlighting; also used for the text replaces
" with ":s///c"
hi IncSearch        cterm=none      ctermbg=1    ctermfg=15

" line number for ":number" and ":#" commands, and when 'number'
" or 'relativenumber' option is set
hi LineNr           cterm=none      ctermbg=none ctermfg=8

" Line number for when the 'relativenumber' option is set,
" above the cursor line.
hi LineNrAbove      cterm=none      ctermbg=none ctermfg=8

" Line number for when the 'relativenumber' option is set,
" below the cursor line.
hi LineNrBelow      cterm=none      ctermbg=none ctermfg=8

" Like LineNr when 'cursorline' is set and 'cursorlineopt'
" contains "number" or is "both", for the cursor line.
hi CursorLineNr     cterm=bold      ctermbg=9    ctermfg=15

" Like SignColumn when 'cursorline' is set for the cursor line.
hi CursorLineSign   cterm=bold      ctermbg=9    ctermfg=15

" Like FoldColumn when 'cursorline' is set for the cursor line.
hi CursorLineFold   cterm=bold      ctermbg=9    ctermfg=15

" The character under the cursor or just before it, if it
" is a paired bracket, and its match. |pi_paren.txt|
hi MatchParen       cterm=bold      ctermbg=none ctermfg=none

" 'showmode' message (e.g., "-- INSERT --")
hi ModeMsg          cterm=bold      ctermbg=4    ctermfg=15

" |more-prompt|
hi MoreMsg          cterm=none      ctermbg=none ctermfg=1

" '@' at the end of the window, characters from 'showbreak'
" and other characters that do not really exist in the text
" (e.g., ">" displayed when a double-wide character doesn't
" fit at the end of the line).
hi NonText          cterm=none      ctermbg=none ctermfg=none

" normal text
hi Normal           cterm=none      ctermbg=none ctermfg=0

" Popup menu: normal item
hi Pmenu            cterm=none      ctermbg=15   ctermfg=0

" Popup menu: selected item
hi PmenuSel         cterm=none      ctermbg=117  ctermfg=0

" Popup menu: scrollbar
hi PmenuSbar        cterm=none      ctermbg=15   ctermfg=0

" Popup menu: thumb of the scrollbar
hi PmenuThumb       cterm=none      ctermbg=117  ctermfg=0

" |hit-enter| prompt and yes/no questions
hi Question         cterm=none      ctermbg=none ctermfg=5

" Current |quickfix| item in the quickfix window.
hi QuickFixLine     cterm=none      ctermbg=4    ctermfg=15

" Last search pattern highlighting (see 'hlsearch').
" Also used for similar items that need to stand out.
hi Search           cterm=none      ctermbg=4    ctermfg=15

" Meta and special keys listed with ":map", also for text used
" to show unprintable characters in the text, 'listchars'.
" Generally: text that is displayed differently from what it
" really is." meta and special keys listed with ":map"
" e.g., 
hi SpecialKey       cterm=none      ctermbg=13   ctermfg=none

" Word that is not recognized by the spellchecker. |spell|
" This will be combined with the highlighting used otherwise.
hi SpellBad         cterm=none      ctermbg=9    ctermfg=15

" Word that should start with a capital. |spell|
" This will be combined with the highlighting used otherwise.
hi SpellCap         cterm=none      ctermbg=11   ctermfg=0

" Word that is recognized by the spellchecker as one that is
" used in another region. |spell|
" This will be combined with the highlighting used otherwise.
hi SpellLocal       cterm=none      ctermbg=11   ctermfg=0

" Word that is recognized by the spellchecker as one that is
" hardly ever used. |spell|
" This will be combined with the highlighting used otherwise.
hi SpellRare        cterm=none      ctermbg=11   ctermfg=0

" status line of current window
hi StatusLine       cterm=none      ctermbg=117  ctermfg=none

" status lines of not-current windows
" Note: if this is equal to "StatusLine" Vim will use "^^^" in
" the status line of the current window.
hi StatusLineNC     cterm=none      ctermbg=7    ctermfg=none

" status line of current window, if it is a |terminal| window.
hi StatusLineTerm   cterm=none      ctermbg=117  ctermfg=none

" status lines of not-current windows that is a |terminal|
" window.
hi StatusLineTermNC cterm=none      ctermbg=7    ctermfg=none

" tab pages line, not active tab page label
hi TabLine          cterm=none      ctermbg=none ctermfg=0

" tab pages line, where there are no labels
hi TabLineFill      cterm=none      ctermbg=none ctermfg=none

" tab pages line, active tab page label
hi TabLineSel       cterm=none      ctermbg=117  ctermfg=0

" |terminal| window (see |terminal-size-color|)
hi Terminal         cterm=none      ctermbg=117  ctermfg=0

" titles for output from ":sel all", ":autocmd" etc.
hi Title            cterm=none      ctermbg=none ctermfg=4

" Visual mode selection
hi Visual           cterm=none      ctermbg=117  ctermfg=0

" Visual mode selection when vim is "Not Owning the Selection".
" Only X11 Gui's |gui-x11| and |xterm-clipboard| supports this.
hi VisualNOS        cterm=none      ctermbg=117  ctermfg=0

" warning messages
hi WarningMsg       cterm=bold      ctermbg=11   ctermfg=0

" current match in 'wildmenu' completion
hi WildMenu         cterm=none      ctermbg=117  ctermfg=0

" The 'statusline' syntax allows the use of 9 different highlights in the
" statusline and ruler (via 'rulerformat').  The names are User1 to User9.
"
" For the GUI you can use the following groups to set the colors for the menu,
" scrollbars and tooltips.  They don't have defaults.  This doesn't work for the
" Win32 GUI.  Only three highlight arguments have any effect here: font, guibg,
" and guifg.
hi User1            cterm=none      ctermbg=117  ctermfg=1
hi User2            cterm=none      ctermbg=117  ctermfg=2
hi User3            cterm=none      ctermbg=117  ctermfg=3
hi User4            cterm=none      ctermbg=117  ctermfg=4
hi User5            cterm=none      ctermbg=117  ctermfg=5
hi User6            cterm=none      ctermbg=117  ctermfg=6
hi User7            cterm=none      ctermbg=117  ctermfg=7
hi User8            cterm=none      ctermbg=117  ctermfg=0
hi User9            cterm=none      ctermbg=117  ctermfg=9

" Current font, background and foreground colors of the menus.
" Also used for the toolbar.
" Applicable highlight arguments: font, guibg, guifg.
hi Menu             cterm=none      ctermbg=13   ctermfg=8

" Current background and foreground of the main window's
" scrollbars.
" Applicable highlight arguments: guibg, guifg.
hi Scrollbar        cterm=none      ctermbg=13   ctermfg=8

" Current font, background and foreground of the tooltips.
" Applicable highlight arguments: font, guibg, guifg.
hi Tooltip          cterm=none      ctermbg=13   ctermfg=8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :help group-name

" any comment
hi Comment          cterm=none      ctermbg=15   ctermfg=8

" any constant
hi Constant         cterm=none      ctermbg=none ctermfg=4

" a string constant: "this is a string"
hi String           cterm=none      ctermbg=195  ctermfg=4

" a character constant: 'c', '\n'
hi Character        cterm=bold      ctermbg=195  ctermfg=4

" a number constant: 234, 0xff
hi Number           cterm=none      ctermbg=none ctermfg=1

" a boolean constant: TRUE, false
hi Boolean          cterm=none      ctermbg=none ctermfg=1

" a floating point constant: 2.3e10
hi Float            cterm=none      ctermbg=none ctermfg=1

" any variable name
hi Identifier       cterm=none      ctermbg=none ctermfg=5

" function name (also: methods for classes)
hi Function         cterm=none      ctermbg=none ctermfg=5

" any statement
hi Statement        cterm=none      ctermbg=none ctermfg=3

" if, then, else, endif, switch, etc.
hi Conditional      cterm=none      ctermbg=none ctermfg=3

" for, do, while, etc.
hi Repeat           cterm=none      ctermbg=none ctermfg=3

" case, default, etc.
hi Label            cterm=none      ctermbg=none ctermfg=3

" "sizeof", "+", "*", etc.
hi Operator         cterm=none      ctermbg=none ctermfg=3

" any other keywords
hi Keyword          cterm=none      ctermbg=none ctermfg=3

" try, catch, throw
hi Exception        cterm=none      ctermbg=none ctermfg=3

" generic Preprocessor
hi PreProc          cterm=none      ctermbg=none ctermfg=1

" preprocessor #include
hi Include          cterm=none      ctermbg=none ctermfg=1

" preprocessor #define
hi Define           cterm=none      ctermbg=none ctermfg=1

" same as Define
hi Macro            cterm=none      ctermbg=none ctermfg=1

" preprocessor #if, #else, #endif, etc.
hi PreCondit        cterm=none      ctermbg=none ctermfg=1

" int, long, char, etc.
hi Type             cterm=none      ctermbg=none ctermfg=2

" static, register, volatile, etc.
hi StorageClass     cterm=none      ctermbg=none ctermfg=3

" struct, union, enum, lua{}, etc.
hi Structure        cterm=none      ctermbg=none ctermfg=3

" A typedef
hi Typedef          cterm=none      ctermbg=none ctermfg=3

" any special symbol
hi Special          cterm=none      ctermbg=none ctermfg=1

" special character in a constant
hi SpecialChar      cterm=none      ctermbg=none ctermfg=1

" you can use CTRL-] on this
hi Tag              cterm=none      ctermbg=none ctermfg=3

" character that needs attention
hi Delimiter        cterm=none      ctermbg=none ctermfg=6

" special things inside a comment
hi SpecialComment   cterm=bold      ctermbg=15   ctermfg=8

"  debugging statements
hi Debug            cterm=none      ctermbg=none ctermfg=0

" text that stands out, HTML links
hi Underlined       cterm=underline ctermbg=none ctermfg=4

" left blank, hidden |hl-Ignore|
hi Ignore           cterm=none      ctermbg=none ctermfg=0

" eny erroneous construct
hi Error            cterm=none      ctermbg=9    ctermfg=15

" anything that needs extra atterntion; mostly the
" keywords TODO, FIXME and XXX
hi Todo             cterm=bold      ctermbg=7    ctermfg=9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
" :help vim-lsp-cxx-highlight

" cpp enum constant
hi LspCxxHlGroupEnumConstant   cterm=none ctermbg=none ctermfg=1

" cpp namespace
hi LspCxxHlGroupNamespace      cterm=bold ctermbg=none ctermfg=3

" cpp class members
hi LspCxxHlGroupMemberVariable cterm=none ctermbg=none ctermfg=8

" :help gitgutter-highlights
hi GitGutterAdd     cterm=none      ctermbg=none ctermfg=2
hi GitGutterChange  cterm=none      ctermbg=none ctermfg=3
hi GitGutterDelete  cterm=none      ctermbg=none ctermfg=1
