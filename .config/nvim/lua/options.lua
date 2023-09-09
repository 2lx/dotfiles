-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/statusline.lua
-- Default options: https://neovim.io/doc/user/vim_diff.html
-- :help nvim-defaults

local g = vim.g
local opt = vim.opt

opt.mouse = 'c'             -- enable the use of the mouse for Command-line mode
opt.number = true           -- show line number
opt.numberwidth = 4         -- minimal number of columns to use for the line number
opt.showmatch = true        -- highlight matching parenthesis

opt.ignorecase = true       -- ignore case letters when search
opt.smartcase = true        -- ignore lowercase for the whole pattern
opt.tabstop = 4             -- 1 tab == 4 spaces
-- opt.softtabstop = 4         -- number of spaces that a <Tab> counts for while performing editing
opt.expandtab = true        -- use spaces instead of tabs
opt.shiftwidth = 4          -- shift 4 spaces when tab
opt.smartindent = true      -- autoindent new lines
-- opt.shiftround = true       -- round indent to multiple of 'shiftwidth'. Applies to > and < commands

opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false        -- don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- autocomplete options
opt.foldmethod = 'marker'   -- enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'      -- line lenght marker at 80 columns
opt.splitright = true       -- vertical split to the right
opt.splitbelow = true       -- horizontal split to the bottom
opt.linebreak = true        -- wrap on word boundary
opt.termguicolors = true    -- enable 24-bit RGB colors
opt.laststatus = 3          -- set global statusline
opt.cmdheight = 2
opt.cursorline = true       -- show current line

opt.listchars = "eol:↵,trail:~,tab:>-,nbsp:␣"
opt.shortmess:remove{ 'S' } -- show the count of search matches in the statusline
opt.shortmess:append("c")   -- coc.nvim. Don't pass messages to |ins-completion-menu|

opt.timeoutlen = 500        -- set mapping delay in ms
opt.ttimeoutlen = 0         -- set key code delay in ms
opt.updatetime = 300        -- coc.nvim param
opt.pumheight = 10          -- limit popup menu height

opt.encoding = "UTF-8"      -- how vim represent characters internally
opt.fileencodings = "UTF-8,cp1251,koi8-r,cp866" -- auto detect encoding written to file
opt.termencoding = "UTF-8"  -- define how keyboard encodes what you type
opt.fileformat = "unix"     -- this gives the <EOL> of the current buffer: <NL>

opt.history = 128           -- history size for Ex mode (:command)
opt.undolevels = 512        -- history size for undo command
opt.undodir = "$HOME/.vim/undo/" -- undofile. make sure to create this directory
opt.hidden = true           -- enable background buffers
opt.lazyredraw = true       -- faster scrolling
opt.synmaxcol = 240         -- max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event

opt.pastetoggle = "<F2>"    -- deprecated

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
