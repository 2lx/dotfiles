" to reload configure use :so $MYVIMRC
" :h option - to show help

syntax enable
" colorscheme eclipse
" colorscheme my_theme
colorscheme my_theme_light
" colorscheme cherryblossom
" colorscheme monokai

set nocompatible                " Vi defaults are not used for the Vim options. It should be placed before other settings
set backspace=indent,eol,start  " to fix some devel-version bugs

" filetype on
filetype plugin indent on       " Indent rules depend on file types
runtime macros/matchit.vim      " Enable if-else matching with % (:h matchit)
set fileformat=unix             " This gives the <EOL> of the current buffer: <NL>
set wildmenu                    " Command-line completion operates in an enhanced mode

" autocmd
autocmd BufNewFile,BufRead *.xinitrc set filetype=sh
autocmd BufNewFile,BufRead *mutt-*   set filetype=mail
autocmd BufNewFile,BufRead *.tex     set filetype=tex
autocmd BufNewFile,BufRead *.lalrpop set filetype=rust
autocmd BufRead,BufNewFile *         set signcolumn=yes
autocmd FileType tagbar,nerdtree     set signcolumn=no

" reload .vimrc on save it
" autocmd bufwritepost .vimrc source $MYVIMRC

" limit the width of text to 72 characters when it is a mail
autocmd BufNewFile,BufRead /tmp/mutt-* set textwidth=72

" each time you save the file delete any trailing whitespace at the eol
" if current file extension not in blacklist
let blacklist = ['rb', 'js', 'pl', 'make', 'text']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e

" disable auto commenting when you insert blank line after a comment line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set tabstop=4                   " Number of spaces that a <Tab> in the file counts for
set softtabstop=4               " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
set shiftwidth=4                " Used with indent commands like >> and <<
set expandtab                   " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set shiftround                  " Round indent to multiple of 'shiftwidth'.  Applies to > and < commands
" set autoindent                  " Copy indent from current line when starting a new line
" set smartindent                 " Do smart autoindenting when starting a new line. Normally 'autoindent' should also be on when using 'smartindent'

set list                        " make whitespace characters visible
set listchars=tab:>-            " show <Tab> like >---

" use space character for buffer vert separators
" use different other fillchars, see :h fillchars
set fillchars+=stl:\ ,stlnc:\ ,vert:\ ,fold:\ ,diff:\     "

set ignorecase                  " The case of normal letters is ignored
set smartcase                   " Override the 'ignorecase' option if the search pattern contains upper case characters

set hlsearch                    " When there is a previous search pattern, highlight all its matches
set incsearch                   " While typing a search command, show where the pattern matches

set number                      " precede each line with its line number
set numberwidth=6               " Minimal number of columns to use for the line number
" set cpoptions+=n                " The column used for 'number' and 'relativenumber' will also be used for text of wrapped lines
" set relativenumber              " Show the line number relative to the line with the cursor
" set ruler                       " Show the line and column number of the cursor position

" highlight extra whitespaces on file opening
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

" :help statusline
set statusline=                     " %f filename
set statusline+=%8*\ %F\            " %F full path
set statusline+=%h%m%r              " %h help flag, %m modified flag, %r read-only flag
set statusline+=%=                  " %= switch to right side
set statusline+=%y\                 " %y file type (:help filetype)
set statusline+=%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}\ \|\         " %{&ff} file format
set statusline+=L\=%l\/             " %l current line number
set statusline+=%L\                 " %L max line number
set statusline+=C\=%c\ \|\          " %c current column number
let &statusline.="%2.2(%{matchstr(getline('.'), '\\%' . col('.') . 'c.')}%)"
set statusline+=\=0x%04B(%03b)\     " %B character under cursor
" set statusline+=%n                  "%n buffer number

" set scrolljump=1                " Minimal number of lines to scroll when the cursor gets off the screen
set scrolloff=10                " Minimal number of screen lines to keep above and below the cursor

set mouse=c                     " Enable the use of the mouse for Command-line mode
set winminheight=0              " The minimal height of a window, when it's not the current window
set winminwidth=0
set wrap                        " When on, lines longer than the width of the window will wrap and displaying continues on the next line
set textwidth=0                 " Maximum width of text that is being inserted. A zero value disables this
set wrapmargin=0                " Number of characters from the right window border where wrapping starts

set laststatus=2                " When the last window will have a status line: always
set showcmd                     " Show (partial) command in the last line of the screen
set cmdheight=2                 " Number of screen lines to use for the command-line, coc.nvim requires more space

set shortmess+=c                " coc.nvim. Don't pass messages to |ins-completion-menu|
" set shortmess=a                 " make vim messages shorter
" You can replace all the tabs with spaces in the entire file with :%retab

set exrc                        " enable load non-default .vimrc

" disable specific non-secure commands from non-default .vimrc
set secure

set timeoutlen=500              " set mapping delay in ms
set ttimeoutlen=0               " set key code delay in ms
set updatetime=300              " coc.nvim param

" how vim represent characters internally
set encoding=UTF-8
" auto detect encoding written to file
set fileencodings=UTF-8,cp1251,koi8-r,cp866
" define how keyboard encodes what you type
set termencoding=UTF-8

" open new split panes to right and bottom
set splitright
set splitbelow

set cursorline                  " show current line
set pumheight=10                " limit popup menu height
set showmatch                   " highlight matching braces

set history=128                 " history size for Ex mode (:command)
set undolevels=512              " history size for undo command
" set undofile                    " save undo history to file
set undodir=$HOME/.vim/undo/    " make sure to create this directory

" for enabling spell checking use :set spell, for disabling :set spell!
" to move cursor to the next misspelled word, enter ]s
" to move cursor to the previous misspelled word, enter [s
" to add word in spell file, enter zg
" to show spelling suggestions, enter z=
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add

set nobackup                    " Disable making a backup before overwriting a file
set nowritebackup               " Issues with coc.nvim
set noswapfile                  " Commands that load new buffers do it without creating a swapfile
set hidden                      " Keep invisible buffers loaded in memory
set clipboard=unnamed           " using anonymous register
set noautochdir                 " When on, Vim will change the current working directory whenever you open a file, switch buffers etc.

let mapleader = ","             " Set prefix key

cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
nnoremap <leader><space> :nohlsearch<CR> " disable search results highlighting

" replace the 'matze/vim-move' plugin
" inoremap <C-j> <Esc>:m .+1<CR>==gi
" inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

map :Q :q
map :W :w

inoremap jj <Esc>

" fast replace
nmap \ :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>

" bind <F2> to paste text unmodified
set pastetoggle=<F2>

" bind <F3> to copy to X clipboard
vmap <F3> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" bind F4 to paste from X clipboard
nmap <F4> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS vim-plug plugin manager
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'     " :help NERDCommenterFunctionalitySummary
Plug 'ap/vim-css-color'
Plug 'yegappan/mru'                 " :MRU
Plug 'yegappan/bufselect'
Plug 'tpope/vim-surround'           " :help surround
Plug 'honza/vim-snippets'           " required by ultisnips
Plug 'SirVer/ultisnips'             " use <tab> after keyword
Plug 'godlygeek/tabular'            " :help tabular | :Tab /=
Plug 'tpope/vim-fugitive'           " :Git blame
Plug 'airblade/vim-gitgutter'

" specific filetypes
" Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xolox/vim-misc'               " required by vim-lua-ftplugin
Plug 'xolox/vim-lua-ftplugin'
Plug '2lx/vim-luafmt'
Plug 'MTDL9/vim-log-highlighting'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'derekwyatt/vim-fswitch'       " switch cpp/hpp :FSHere
Plug 'rust-lang/rust.vim'
Plug 'fannheyward/coc-rust-analyzer'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" other
" Plug 'easymotion/vim-easymotion'
" Plug 'junegunn/goyo.vim'
call plug#end()

" folding keys: (zo) - open, (zc) - close
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-lsp-cxx-highlight {{{
let g:lsp_cxx_hl_light_bg=1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN gitgutter {{{
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN coc.nvim {{{
" https://codevion.github.io/#!vim/coc.md
" https://www.youtube.com/watch?v=ViHgyApE9zM

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-lua-ftplugin {{{
" let g:lua_complete_omni = 0
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN ultisnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-latex-live-preview {{{
" use LLPStartPreview
" let g:livepreview_previewer = 'mupdf'
" set updatetime=100000000
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN nerdtree
" use <leader>f to open the tree buffer
" then use ? for help
" {{{
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>` :tabe ~/.vimrc<Enter>
" Open quickfix window if there are errors, close it otherwise
nnoremap <Leader>q :cw<Enter>
nnoremap <Leader>n :cn<Enter>
nnoremap <Leader>p :cp<Enter>

" open NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree

" open NERDTree automatically if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 0                   " set minimal NERDTree interface
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=0                    " enable to show hidden files
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN vim-nerdcommenter
" :help nerdcommenter
" {{{
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" set a language to use its alternate delimiters by default
let g:NERDAltDelims_cpp = 1
" add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'cpp': { 'left': '//' } }
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN goyo {{{
let g:goyo_width = 100
nnoremap <Leader>g :Goyo<Enter>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN bufselect {{{
nnoremap <Leader>b :Bufselect<Enter>
" }}}

" vim: set fdm=marker fmr={{{,}}} fdl=0 :
