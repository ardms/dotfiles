require("config.lazy")

vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.undofile = true
vim.opt.undodir='/home/aris/.config/nvim/undo'
-- vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣' }

-- Navigate to previous and next element in quickfix list
vim.keymap.set("n", "<leader>n", "<cmd>cnext<CR>")
vim.keymap.set("n", "<leader>p", "<cmd>cprev<CR>")

-- Lua example for init.lua
vim.api.nvim_set_keymap('n', '<leader>ne', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pe', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

----------------------------------------------------
-- Functions
----------------------------------------------------

function LoadTemplateWithPlaceholders()
    -- Read the template file
    local template_path = vim.fn.expand('~/.config/nvim/templates/template.md')
    local template_lines = vim.fn.readfile(template_path)

    -- Get the current date and filename
    local current_date = os.date('%Y-%m-%d')
    local current_filename = vim.fn.expand('%:t:r')

    -- Replace placeholders in the template
    for i, line in ipairs(template_lines) do
        template_lines[i] = line:gsub('{{date}}', current_date)
        template_lines[i] = template_lines[i]:gsub('{{filename}}', current_filename)
    end

    -- Insert the modified template into the current buffer
    vim.api.nvim_buf_set_lines(0, 0, -1, false, template_lines)
end



----------------------------------------------------
-- Autocommands
----------------------------------------------------

-- Load template file every time a markdown file is created
vim.api.nvim_create_autocmd(
    'bufNewFile',
    {
        pattern = '*.md',
        callback = LoadTemplateWithPlaceholders,
    }
)

-- Load template file for Python files
vim.api.nvim_create_autocmd(
    'bufNewFile' ,
    {
        pattern = '*.py',
        command = '0r ~/.config/nvim/templates/template.py',
    }
)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
        vim.fn.system('clip.exe', vim.fn.getreg('"'))
    end,
})
