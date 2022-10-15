set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
let &packpath=&runtimepath

runtime macros/matchit.vim      " Enable if-else matching with % (:h matchit)
set listchars=eol:↵,trail:~,tab:>-,nbsp:␣
let mapleader=","               " Set prefix key
set fileformat=unix             " This gives the <EOL> of the current buffer: <NL>
autocmd BufRead,BufNewFile *         set signcolumn=yes
autocmd FileType tagbar,nerdtree     set signcolumn=no

set number                      " precede each line with its line number
set numberwidth=4               " Minimal number of columns to use for the line number
set ignorecase                  " The case of normal letters is ignored
set smartcase                   " Override the 'ignorecase' option if the search pattern contains upper case characters
set tabstop=4                   " Number of spaces that a <Tab> in the file counts for
set softtabstop=4               " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
set shiftwidth=4                " Used with indent commands like >> and <<
set expandtab                   " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set shiftround                  " Round indent to multiple of 'shiftwidth'.  Applies to > and < commands

set mouse=c                     " Enable the use of the mouse for Command-line mode
set winminheight=0              " The minimal height of a window, when it's not the current window
set winminwidth=0
set wrap                        " When on, lines longer than the width of the window will wrap and displaying continues on the next line
set textwidth=0                 " Maximum width of text that is being inserted. A zero value disables this
set wrapmargin=0                " Number of characters from the right window border where wrapping starts

set laststatus=2                " When the last window will have a status line: always
set showcmd                     " Show (partial) command in the last line of the screen
set cmdheight=2                 " Number of screen lines to use for the command-line, coc.nvim requires more space

set shortmess-=S                " show the count of search matches in the statusline
set shortmess+=c                " coc.nvim. Don't pass messages to |ins-completion-menu|

set timeoutlen=500              " set mapping delay in ms
set ttimeoutlen=0               " set key code delay in ms
set updatetime=300              " coc.nvim param

" disable auto commenting when you insert blank line after a comment line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" how vim represent characters internally
set encoding=UTF-8
" auto detect encoding written to file
set fileencodings=UTF-8,cp1251,koi8-r,cp866
" define how keyboard encodes what you type
set termencoding=UTF-8

set splitright                  " open new split panes to right and bottom
set splitbelow

set cursorline                  " show current line
set pumheight=10                " limit popup menu height
set showmatch                   " highlight matching braces

set history=128                 " history size for Ex mode (:command)
set undolevels=512              " history size for undo command
set undodir=$HOME/.vim/undo/    " undofile. make sure to create this directory

" for enabling spell checking use :set spell, for disabling :set spell!
" to move cursor to the next misspelled word, enter ]s
" to move cursor to the previous misspelled word, enter [s
" to add word in spell file, enter zg
" to show spelling suggestions, enter z=
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add

call plug#begin('~/.vim/plugged')
Plug 'sonph/onehalf', { 'rtp': 'vim' } " colortheme
Plug 'kyazdani42/nvim-web-devicons' " required by nvim-tree, lualine
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'        " required by telescope
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'     " :help NERDCommenterFunctionalitySummary
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'           " :help surround
Plug 'tpope/vim-fugitive'           " :G blame -
Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'
call plug#end()

" setup lua plugins
lua require('nvim_tree')
lua require('telescope')
lua require('lualine')

" enable true 24bit colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" colorscheme
colorscheme onehalflight
let g:lightline = { 'colorscheme': 'onehalflight' }

" mapping
nnoremap <Leader>f <cmd>NvimTreeFindFile<CR>
nnoremap <leader>F <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>gb :G blame<CR>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
nnoremap <leader><space> :nohlsearch<CR> " disable search results highlighting
map :Q :q
map :W :w
map :wQ :wq

" fast replace
nmap \ :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>
set pastetoggle=<F2> " to paste text unmodified

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        TagbarClose
        copen
        TagbarOpen
    else
        cclose
    endif
endfunction
nnoremap <Leader>q :call ToggleQuickFix()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-better-whitespace
" {{{
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0
let g:strip_only_modified_lines = 1
let g:strip_whitelines_at_eof = 1
let g:show_spaces_that_precede_tabs = 1
let g:better_whitespace_filetypes_blacklist=['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-nerdcommenter
" {{{
" :help nerdcommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" set a language to use its alternate delimiters by default
let g:NERDAltDelims_cpp = 1

" add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN tagbar
" {{{
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_compact = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN gitgutter
" {{{
" stage the hunk with <Leader>hs or
" undo it with <Leader>hu.
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
" nnoremap <Leader>hd :GitGutterDiffOrig<Enter>
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN nvim-tree
" {{{
let g:nvim_tree_auto_close=1

" close nvim-tree automatically, if it is the last buffer
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
" }}}

" vim: set fdm=marker fmr={{{,}}} fdl=0 :
