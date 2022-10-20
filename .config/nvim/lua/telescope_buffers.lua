local fn_popup_buffers = function()
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    builtin.buffers(themes.get_dropdown({
        on_complete = { function() vim.cmd "stopinsert" end },
        layout_config = { width = 0.5, height = 0.5 },
        previewer = false,
        sort_lastused = true
    }))
end

return fn_popup_buffers
