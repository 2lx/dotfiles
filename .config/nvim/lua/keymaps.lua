-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/keymaps.lua

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = false }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ","

-- common
map("c", "<c-p>", "<Up>")
map("c", "<c-n>", "<Down>")

-- typos
map("", ":Q", ":q")
map("", ":W", ":w")
map("", ":wQ", ":wq")
map("", ":wA", ":wa")
map("", ":waq", ":wa")
map("", ":wqa", ":wa")

-- fast replace
map("n", "<Bslash>", ':%s/<Bslash><<C-r>=expand("<cword>")<CR><Bslash>>/<C-r>=expand("<cword>")<CR>')

-- leader
map("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>")
map("n", "<leader>B", "<cmd>Telescope find_files<CR>")
map("n", "<leader>b", "<cmd>Telescope buffers<CR>")
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
map("n", "<leader>?", "<cmd>Telescope keymaps<CR>")
map("n", "<leader>m", "<cmd>Telescope man_pages<CR>")

-- registers
map("n", "<leader>r", "<cmd>Telescope registers<CR>")
for c in string.gmatch("abcdefghijklmnopqrstuvwxyz0123456789%.:+*:=#-\"", ".") do
    map("n", "<leader>r" .. c, "\"" .. c .. "p<CR>")
end

-- quickfix
map("n", "<leader>q", "<cmd>Telescope quickfix<CR>")
map("n", "<leader>qn", ":cnext<CR>")
map("n", "<leader>qp", ":cprev<CR>")

-- git
map("n", "<leader>gb", ":G blame<CR>")

-- disable search results highlighting
map("n", "<leader><space>", ":nohlsearch<CR>")

-- switch source/header
map("n", "<leader>s", "<cmd>lua require('switch_source_header')()<CR>")

--json
map("v", "<leader>jf", ":!python -m json.tool<CR>")
map("n", "<leader>jf", ":%!python -m json.tool<CR>")
