set runtimepath^=~/.config/nvim/

call plug#begin('~/.vim/plugged')
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'kyazdani42/nvim-web-devicons' " required by nvim-tree, lualine
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim' " required by telescope
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

let mapleader = ","             " Set prefix key

" enable true 24bit colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" colorscheme
colorscheme onehalflight
let g:lightline = { 'colorscheme': 'onehalflight' }

nnoremap <Leader>f :NvimTreeFindFile<CR>
nnoremap <leader>F <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

lua require('nvim_tree')
lua require('telescope')
lua require('lualine')
