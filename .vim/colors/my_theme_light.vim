" ==============================================================================
"   Name:        NVim Light
"   Author:      Alex Minchakov <lexaaim@gmail.com>
"   Url:         https://github.com/2lx/dotfiles
"   License:     The MIT License (MIT)
"
"   A light vim color scheme based on OneHalf theme.
"
"   hi [hl-group] cterm=[none,bold,underline,uncercurl,inverse,italic,standout,nocombine,strikethrough,attr-list]
"   ctermbg= ctermfg= gui= guibg= guifg=
"
"   :help highlight-groups
" ==============================================================================

set background=light
highlight clear
syntax reset

let g:colors_name="nvim_light"
let colors_name="nvim_light"


let s:black         = { "gui": "#24292e", "cterm": "0" }
let s:red           = { "gui": "#db524e", "cterm": "1" }
let s:green         = { "gui": "#1cad3c", "cterm": "2" }
let s:yellow        = { "gui": "#c59000", "cterm": "3" }
let s:blue          = { "gui": "#5a93ff", "cterm": "4" }
let s:purple        = { "gui": "#6f42c1", "cterm": "5" }
let s:cyan          = { "gui": "#08916a", "cterm": "6" }
let s:light_grey    = { "gui": "#d0d0d0", "cterm": "7" }
let s:dark_grey     = { "gui": "#828482", "cterm": "8" }
let s:spec_red    = { "gui": "#c03545", "cterm": "9" }
let s:spec_green  = { "gui": "#1cad3c", "cterm": "10" }
let s:spec_yellow = { "gui": "#ffe914", "cterm": "11" }
let s:spec_blue   = { "gui": "#5ca7e4", "cterm": "12" }
let s:spec_purple = { "gui": "#afb0ff", "cterm": "13" }
let s:spec_cyan   = { "gui": "#00c990", "cterm": "14" }
let s:spec_white  = { "gui": "#ffffff", "cterm": "15" }
let s:white         = { "gui": "#ffffff", "cterm": "255" }

let s:col0  = s:black
let s:col1  = s:red
let s:col2  = s:green
let s:col3  = s:yellow
let s:col4  = s:blue
let s:col5  = s:purple
let s:col6  = s:cyan
let s:col7  = s:light_grey
let s:col8  = s:dark_grey
let s:col9  = s:spec_red
let s:col10 = s:spec_green
let s:col11 = s:spec_yellow
let s:col12 = s:spec_blue
let s:col13 = s:spec_purple
let s:col14 = s:spec_cyan
let s:col15 = s:spec_white

let s:fg    = s:black
let s:bg    = s:white
let s:selection   = { "gui": "#bfceff", "cterm": "117" }
let s:string_bg   = { "gui": "#f4f8ff", "cterm": "195" }
let s:comment_fg  = s:dark_grey
let s:comment_bg  = { "gui": "#f1f1f1", "cterm": "15" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:h(group, fg, bg, attr)
  if type(a:fg) == type({})
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
  else
    exec "hi " . a:group . " guifg=NONE cterm=NONE"
  endif
  if type(a:bg) == type({})
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
  else
    exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  else
    exec "hi " . a:group . " gui=NONE cterm=NONE"
  endif
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface colors

" used for the columns set with 'colorcolumn'
call s:h("ColorColumn", s:black, s:light_grey, "")

" placeholder characters substituted for concealed text
" (see 'conceallevel')
call s:h("Conceal", s:purple, s:red, "")

" the character under the cursor
call s:h("Cursor", s:black, s:white, "bold")

" the character under the cursor when |language-mapping|
" is used (see 'guicursor')
call s:h("lCursor", s:black, s:white, "bold")

" like Cursor, but used when in IME mode |CursorIM|
call s:h("CursorIM", s:black, s:white, "bold")

" the screen column that the cursor is in when 'cursorcolumn' is set
call s:h("CursorColumn", "", "", "")

" the screen line that the cursor is in when 'cursorline' is set
call s:h("CursorLine", "", "", "")

" directory names (and other special names in listings)
call s:h("Directory", s:blue, "", "bold")

" diff mode: Added line |diff.txt|
call s:h("DiffAdd", s:green, "", "bold")

" diff mode: Changed line |diff.txt|
call s:h("DiffChange", s:yellow, "", "bold")

" diff mode: Deleted line |diff.txt|
call s:h("DiffDelete", s:red, "", "bold")

" diff mode: Changed text within a changed line |diff.txt|
call s:h("DiffText", s:yellow, "", "bold")

" filler lines (~) after the last line in the buffer.
" By default, this is highlighted like |hl-NonText|
call s:h("EndOfBuffer", s:spec_white, "", "")

" error messages on the command line
call s:h("ErrorMsg", s:black, s:spec_red, "")

" the column separating vertically split windows
call s:h("VertSplit", "", s:light_grey, "")

" line used for closed folds
call s:h("Folded", s:cyan, s:white, "")

" 'foldcolumn'
call s:h("FoldColumn", s:cyan, s:white, "")

" column where |signs| are displayed
call s:h("SignColumn", s:green, "", "")

" 'incsearch' highlighting; also used for the text replaces
" with ":s///c"
call s:h("IncSearch", s:spec_white, s:red, "")

" line number for ":number" and ":#" commands, and when 'number'
" or 'relativenumber' option is set
call s:h("LineNr", s:dark_grey, "", "")

" Line number for when the 'relativenumber' option is set,
" above the cursor line.
call s:h("LineNrAbove", s:dark_grey, "", "")

" Line number for when the 'relativenumber' option is set,
" below the cursor line.
call s:h("LineNrBelow", s:dark_grey, "", "")

" Like LineNr when 'cursorline' is set and 'cursorlineopt'
" contains "number" or is "both", for the cursor line.
call s:h("CursorLineNr", s:black, "", "bold")

" Like SignColumn when 'cursorline' is set for the cursor line.
call s:h("CursorLineSign", s:black, "", "bold")

" Like FoldColumn when 'cursorline' is set for the cursor line.
call s:h("CursorLineFold", s:black, "", "bold")

" The character under the cursor or just before it, if it
" is a paired bracket, and its match. |pi_paren.txt|
call s:h("MatchParen", "", "", "bold,underline")

" 'showmode' message (e.g., "-- INSERT --")
call s:h("ModeMsg", s:spec_white, s:blue, "bold")

" |more-prompt|
call s:h("MoreMsg", s:red, "", "")

" '@' at the end of the window, characters from 'showbreak'
" and other characters that do not really exist in the text
" (e.g., ">" displayed when a double-wide character doesn't
" fit at the end of the line).
call s:h("NonText", "", "", "")

" normal text
call s:h("Normal", s:black, "", "")

" Popup menu: normal item
call s:h("Pmenu", s:black, s:white, "")

" Popup menu: selected item
call s:h("PmenuSel", s:black, s:selection, "")

" Popup menu: scrollbar
call s:h("PmenuSbar", s:black, s:white, "")

" Popup menu: thumb of the scrollbar
call s:h("PmenuThumb", s:black, s:selection, "")

" |hit-enter| prompt and yes/no questions
call s:h("Question", s:purple, "", "")

" Current |quickfix| item in the quickfix window.
call s:h("QuickFixLine", s:spec_white, s:blue, "")

" Last search pattern highlighting (see 'hlsearch').
" Also used for similar items that need to stand out.
call s:h("Search", s:spec_white, s:blue, "")

" Meta and special keys listed with ":map", also for text used
" to show unprintable characters in the text, 'listchars'.
" Generally: text that is displayed differently from what it
" really is." meta and special keys listed with ":map"
" e.g., 
call s:h("SpecialKey", "", s:spec_purple, "")

" Word that is not recognized by the spellchecker. |spell|
" This will be combined with the highlighting used otherwise.
call s:h("SpellBad", s:spec_white, s:spec_red, "")

" Word that should start with a capital. |spell|
" This will be combined with the highlighting used otherwise.
call s:h("SpellCap", s:black, s:spec_yellow, "")

" Word that is recognized by the spellchecker as one that is
" used in another region. |spell|
" This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", s:black, s:spec_yellow, "")

" Word that is recognized by the spellchecker as one that is
" hardly ever used. |spell|
" This will be combined with the highlighting used otherwise.
call s:h("SpellRare", s:black, s:spec_yellow, "")

" status line of current window
call s:h("StatusLine", "", s:selection, "")

" status lines of not-current windows
" Note: if this is equal to "StatusLine" Vim will use "^^^" in
" the status line of the current window.
call s:h("StatusLineNC", "", s:light_grey, "")

" status line of current window, if it is a |terminal| window.
call s:h("StatusLineTerm", "", s:selection, "")

" status lines of not-current windows that is a |terminal|
" window.
call s:h("StatusLineTermNC", "", s:light_grey, "")

" tab pages line, not active tab page label
call s:h("TabLine", s:black, "", "")

" tab pages line, where there are no labels
call s:h("TabLineFill", "", "", "")

" tab pages line, active tab page label
call s:h("TabLineSel", s:black, s:selection, "")

" |terminal| window (see |terminal-size-color|)
call s:h("Terminal", s:fg, s:bg, "")

" titles for output from ":sel all", ":autocmd" etc.
call s:h("Title", s:blue, "", "")

" Visual mode selection
call s:h("Visual", s:black, s:selection, "")

" Visual mode selection when vim is "Not Owning the Selection".
" Only X11 Gui's |gui-x11| and |xterm-clipboard| supports this.
call s:h("VisualNOS", s:black, s:selection, "")

" warning messages
call s:h("WarningMsg", s:black, s:spec_yellow, "bold")

" current match in 'wildmenu' completion
call s:h("WildMenu", s:black, s:selection, "")

" The 'statusline' syntax allows the use of 9 different highlights in the
" statusline and ruler (via 'rulerformat').  The names are User1 to User9.
"
" For the GUI you can use the following groups to set the colors for the menu,
" scrollbars and tooltips.  They don't have defaults.  This doesn't work for the
" Win32 GUI.  Only three highlight arguments have any effect here: font, guibg,
" and guifg.
call s:h("User1", s:red, s:selection, "")
call s:h("User2", s:green, s:selection, "")
call s:h("User3", s:yellow, s:selection, "")
call s:h("User4", s:blue, s:selection, "")
call s:h("User5", s:purple, s:selection, "")
call s:h("User6", s:cyan, s:selection, "")
call s:h("User7", s:spec_white, s:selection, "")
call s:h("User8", s:black, s:selection, "")
call s:h("User9", s:spec_red, s:selection, "")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax colors

" any comment
call s:h("Comment", s:dark_grey, s:comment_bg, "")

call s:h("Whitespace", "", "", "")

" any constant
call s:h("Constant", s:blue, "", "")

" a string constant: "this is a string"
call s:h("String", s:blue, s:string_bg, "")

" a character constant: 'c', '\n'
call s:h("Character", s:blue, s:string_bg, "bold")

" a number constant: 234, 0xff
call s:h("Number", s:red, "", "")

" a boolean constant: TRUE, false
call s:h("Boolean", s:red, "", "")

" a floating point constant: 2.3e10
call s:h("Float", s:red, "", "")

" any variable name
call s:h("Identifier", s:purple, "", "")

" function name (also: methods for classes)
call s:h("Function", s:purple, "", "")

" any statement
call s:h("Statement", s:yellow, "", "")

" if, then, else, endif, switch, etc.
call s:h("Conditional", s:yellow, "", "")

" for, do, while, etc.
call s:h("Repeat", s:yellow, "", "")

" case, default, etc.
call s:h("Label", s:yellow, "", "")

" "sizeof", "+", "*", etc.
call s:h("Operator", s:yellow, "", "")

" any other keywords
call s:h("Keyword", s:yellow, "", "")

" try, catch, throw
call s:h("Exception", s:yellow, "", "")

" generic Preprocessor
call s:h("PreProc", s:red, "", "")

" preprocessor #include
call s:h("Include", s:red, "", "")

" preprocessor #define
call s:h("Define", s:red, "", "")

" same as Define
call s:h("Macro", s:red, "", "")

" preprocessor #if, #else, #endif, etc.
call s:h("PreCondit", s:red, "", "")

" int, long, char, etc.
call s:h("Type", s:green, "", "")

" static, register, volatile, etc.
call s:h("StorageClass", s:yellow, "", "")

" struct, union, enum, lua{}, etc.
call s:h("Structure", s:yellow, "", "")

" A typedef
call s:h("Typedef", s:yellow, "", "")

" any special symbol
call s:h("Special", s:red, "", "")

" special character in a constant
call s:h("SpecialChar", s:red, "", "")

" you can use CTRL-] on this
call s:h("Tag", s:yellow, "", "")

" character that needs attention
call s:h("Delimiter", s:cyan, "", "")

" special things inside a comment
call s:h("SpecialComment", s:dark_grey, s:white, "bold")

"  debugging statements
call s:h("Debug", s:black, "", "bold")

" text that stands out, HTML links
call s:h("Underlined", s:blue, "", "underline")

" left blank, hidden |hl-Ignore|
call s:h("Ignore", s:black, "", "")

" eny erroneous construct
call s:h("Error", s:spec_white, s:spec_red, "")

" anything that needs extra atterntion; mostly the
" keywords TODO, FIXME and XXX
call s:h("Todo", s:spec_red, s:light_grey, "bold")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-lsp-cxx-highlight
" :help vim-lsp-cxx-highlight

" cpp enum constant
call s:h("LspCxxHlGroupEnumConstant", s:red, "", "")

" cpp namespace
call s:h("LspCxxHlGroupNamespace", s:yellow, "", "bold")

" cpp class members
call s:h("LspCxxHlGroupMemberVariable", s:dark_grey, "", "")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin GitGutter :help gitgutter-highlights
call s:h("GitGutterAdd", s:green, "", "")
call s:h("GitGutterChange", s:yellow, "", "")
call s:h("GitGutterDelete", s:red, "", "")
call s:h("GitGutterChangeDelete", s:red, "", "")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Fugitive
call s:h("diffAdded", s:green, "", "")
call s:h("diffRemoved", s:red, "", "")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
call s:h("gitcommitComment", s:comment_fg, "", "")
call s:h("gitcommitUnmerged", s:red, "", "")
call s:h("gitcommitOnBranch", s:fg, "", "")
call s:h("gitcommitBranch", s:purple, "", "")
call s:h("gitcommitDiscardedType", s:red, "", "")
call s:h("gitcommitSelectedType", s:green, "", "")
call s:h("gitcommitHeader", s:fg, "", "")
call s:h("gitcommitUntrackedFile", s:cyan, "", "")
call s:h("gitcommitDiscardedFile", s:red, "", "")
call s:h("gitcommitSelectedFile", s:green, "", "")
call s:h("gitcommitUnmergedFile", s:yellow, "", "")
call s:h("gitcommitFile", s:fg, "", "")
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix colors in neovim terminal buffers {
if has('nvim')
  let g:terminal_color_0 = s:black.gui
  let g:terminal_color_1 = s:red.gui
  let g:terminal_color_2 = s:green.gui
  let g:terminal_color_3 = s:yellow.gui
  let g:terminal_color_4 = s:blue.gui
  let g:terminal_color_5 = s:purple.gui
  let g:terminal_color_6 = s:cyan.gui
  let g:terminal_color_7 = s:white.gui
  let g:terminal_color_8 = s:black.gui
  let g:terminal_color_9 = s:red.gui
  let g:terminal_color_10 = s:green.gui
  let g:terminal_color_11 = s:yellow.gui
  let g:terminal_color_12 = s:blue.gui
  let g:terminal_color_13 = s:purple.gui
  let g:terminal_color_14 = s:cyan.gui
  let g:terminal_color_15 = s:white.gui
  let g:terminal_color_background = s:bg.gui
  let g:terminal_color_foreground = s:fg.gui
endif
