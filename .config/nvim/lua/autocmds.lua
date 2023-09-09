-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/autocmds.lua
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
    end
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript', 'yaml' },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o',
})

-- Set spellcheck for markdown files
autocmd("FileType", {
    pattern = "markdown",
    command = "set spelllang=ru_yo spell",
})

-- always show signcolumn
autocmd("BufRead", {
    pattern = "",
    command = "set signcolumn=yes",
})
autocmd("BufNewFile", {
    pattern = "",
    command = "set signcolumn=yes",
})

-- do cd on reading first file
local ft_to_cd = {
    cpp = "src",
    lua = "misc/scripts",
}

local first_file_open = true
autocmd("BufRead", {
    pattern = { "*" },
    callback = function()
        local path = ft_to_cd[string.lower(vim.bo.filetype)]
        if first_file_open and path then
            vim.loop.chdir(path)
        end
        first_file_open = false
    end,
})
