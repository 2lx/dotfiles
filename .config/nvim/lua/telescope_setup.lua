local actions = require("telescope.actions")
-- local actions_layout = require("telescope.actions.layout")

require('telescope').setup{
    defaults = {
        mappings = {
            n = {
                ['<c-d>'] = actions.delete_buffer,
                -- ["<c-p>"] = actions_layout.toggle_preview,
            },
            i = {
                ["<esc>"] = actions.close,
                ["<c-h>"] = "which_key",
                ["<c-d>"] = actions.delete_buffer,
                -- ["<c-p>"] = actions_layout.toggle_preview,
            }
        }
    },
}
