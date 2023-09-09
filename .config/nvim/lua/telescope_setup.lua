local telescope = require('telescope')
local actions = require("telescope.actions")
local themes = require('telescope.themes')

-- start picker in vim normal mode
local fn_stop_insert = function()
    vim.cmd("stopinsert")
end

local fn_do_action_n_times = function(action, n)
    return function(...)
        for _ = 1, n do action(...) end
    end
end

telescope.setup {
    pickers = {
        -- :help telescope.builtin.buffers()
        buffers = themes.get_dropdown({
            show_all_buffers = true,
            ignore_current_buffer = true,
            only_cwd = false,
            sort_lastused = false,
            sort_mru = true,
            on_complete = { fn_stop_insert },
            layout_config = { width = 0.5, height = 0.5 },
            previewer = false,
            mappings = {
                n = {
                    ["D"] = actions.delete_buffer,
                },
            }
        }),
        -- :help telescope.builtin.find_files()
        find_files = {
            follow = true,
            hidden = false,
            no_ignore = true,
            no_ignore_parent = true,
        },
        -- :help telescope.builtin.quickfix()
        quickfix = {
            on_complete = { fn_stop_insert },
        },
        -- :help telescope.builtin.registers()
        registers = {
            on_complete = { fn_stop_insert },
        },
        -- :help telescope.builtin.keymaps()
        keymaps = {
            on_complete = { fn_stop_insert },
        },
        -- :help telescope.builtin.git_status()
        git_status = {
            on_complete = { fn_stop_insert },
        },
    },
    defaults = {
        mappings = {
            n = {
                ["<c-u>"] = fn_do_action_n_times(actions.move_selection_previous, 5),
                ["<c-d>"] = fn_do_action_n_times(actions.move_selection_next, 5),
                ["<Down>"] = actions.preview_scrolling_down,
                ["<Up>"] = actions.preview_scrolling_up,
            },
        }
    },
}
