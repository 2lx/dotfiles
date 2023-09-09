local telescope = require('telescope')
local actions = require("telescope.actions")
local themes = require('telescope.themes')

telescope.setup {
    pickers = {
        buffers = themes.get_dropdown({
            show_all_buffers = true,
            ignore_current_buffer = true,
            only_cwd = false,
            sort_lastused = false,
            sort_mru = true,
            on_complete = { function() vim.cmd "stopinsert" end },
            layout_config = { width = 0.5, height = 0.5 },
            previewer = false,
        }),
        find_files = {
            follow = true,
            hidden = false,
            no_ignore = true,
            no_ignore_parent = true,
        },
    },
    defaults = {
        mappings = {
            n = {
                ['<c-d>'] = actions.delete_buffer
            },
            i = {
                ['<c-d>'] = actions.delete_buffer
            }
        }
    },
}
