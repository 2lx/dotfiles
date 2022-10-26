local c_sources = { "c", "cc", "cp", "cpp", "c++", "cxx" }
local c_headers = { "h", "hh", "h++", "hxx" }

local mapping = { }
local function update_mapping(srcs, tgts)
    local all_tgt = { }
    for _, tgt in ipairs(tgts) do
        table.insert(all_tgt, tgt)
        table.insert(all_tgt, string.upper(tgt))
    end

    for _, ext in ipairs(srcs) do mapping[ext] = all_tgt end
end

update_mapping(c_sources, c_headers)
update_mapping(c_headers, c_sources)

-- :help filename-modifiers
return function()
    local file_ext = string.lower(vim.fn.expand("%:e"))
    for _, ext in ipairs(mapping[file_ext] or { }) do
        local pair = string.format("%s.%s", vim.fn.expand("%:r"), ext)

        if vim.fn.filereadable(pair) == 1 then
            vim.api.nvim_command("find " .. pair)
            break
        end
    end
end
