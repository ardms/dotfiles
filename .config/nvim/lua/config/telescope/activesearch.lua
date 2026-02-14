local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local Path = require("plenary.path")
local scan = require("plenary.scandir")
local previewers = require("telescope.previewers")

-- Helper to get Git root (or fallback to cwd)
local function get_project_root()
    local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    if vim.v.shell_error == 0 then
        return git_root
    else
        return vim.fn.getcwd()
    end
end

-- Check if a file has frontmatter with status: active
local function has_active_status(file)
    local lines = Path:new(file):readlines()
    local in_frontmatter = false
    for _, line in ipairs(lines) do
        if line:match("^%-%-%-") then
            if not in_frontmatter then
                in_frontmatter = true
            else
                break -- end of frontmatter
            end
        elseif in_frontmatter then
            local key, val = line:match("^([%w_]+):%s*(.+)$")
            if key == "status" and val == "active" then
                return true
            end
        end
    end
    return false
end

-- Main Telescope picker
local function search_active_markdown_files()
    local root = get_project_root()
    local results = {}

    scan.scan_dir(root, {
        depth = 10,
        add_dirs = false,
        search_pattern = "%.md$",
        on_insert = function(file)
            if has_active_status(file) then
                table.insert(results, vim.fn.fnamemodify(file, ":t"))
            end
        end
    })

    pickers.new({}, {
        prompt_title = "Active Markdown Files",
        finder = finders.new_table {
            results = results,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry,
                }
            end,
        },
        sorter = conf.generic_sorter({}),
        previewer = conf.grep_previewer({}),
        -- previewers.cat.new({}),
    }):find()
end

M.setup = function()
    vim.keymap.set("n", "<leader>fa", search_active_markdown_files)
end

return M
