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
" colorschemes
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'ayu-theme/ayu-vim'
Plug '2lx/lazylight'
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

" specific filetypes
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xolox/vim-misc'               " required by vim-lua-ftplugin
Plug 'xolox/vim-lua-ftplugin'
Plug '2lx/vim-luafmt'
Plug 'MTDL9/vim-log-highlighting'
Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

" setup lua plugins
lua require('nvim_tree_setup')
lua require('telescope_setup')
lua require('lualine_setup')

" enable true 24bit colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors  " enable true colors support
endif

" colorscheme ayu
" colorscheme onehalflight
colorscheme lazylight

" mapping
nnoremap <leader>f <cmd>NvimTreeFindFile<cr>
nnoremap <leader>F <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>lua require('telescope_buffers')()<CR>
nnoremap <leader>gb :G blame<cr>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
nnoremap <leader><space> :nohlsearch<CR> " disable search results highlighting
nnoremap <leader>s <cmd>lua require('switch_source_header')()<CR>

map :Q :q
map :W :w
map :wQ :wq

" json format
vnoremap <leader>jf :!python -m json.tool<CR>
nnoremap <leader>jf :%!python -m json.tool<CR>

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
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1 " :EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1
autocmd FileType * EnableStripWhitespaceOnSave
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
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
vmap <leader>f  <Plug>(coc-format-selected)

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


" vim: set fdm=marker fmr={{{,}}} fdl=0 :
