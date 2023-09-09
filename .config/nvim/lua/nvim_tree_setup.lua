-- :help nvim-tree-setup
local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

nvim_tree.setup({
    on_attach = my_on_attach,
    auto_reload_on_write = true,
    filters = {
        custom = { "^.git$" },
        dotfiles = false,
    },
    renderer = {
        group_empty = true,
    },
    sort = {
        folders_first = true,
        sorter = "case_sensitive",
    },
    view = {
        adaptive_size = true,
        centralize_selection = false,
        cursorline = true,
    },
})
