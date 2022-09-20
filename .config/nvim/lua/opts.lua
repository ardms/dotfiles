-- Set Local variables for use in the Buffer
local opt = vim.opt
local cmd = vim.api.nvim_command

-------------------------------------------------------------------------------
-- GENERAL
-------------------------------------------------------------------------------
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.clipboard = "unnamedplus"  -- allows neovim to access the system clipboard

opt.mouse = "a"  -- Mouse support 

opt.smartcase = true
opt.smartindent = true

opt.hlsearch = true  -- permanently hilight search results until :noh

opt.fileencoding = "utf-8"

cmd [[set iskeyword+="-,_"]]

opt.wrap = false

opt.wildignore = "data/**,*/__pycache__/**,*.ipynb,*.xl*"

-------------------------------------------------------------------------------
-- LOOK AND FEEL
-------------------------------------------------------------------------------
opt.showtabline = 2 -- always show the tabs at the top

opt.cursorline = true

opt.splitbelow = true
opt.splitright = true

opt.showmatch = true

opt.number = true
opt.relativenumber = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.syntax = "ON"                -- str:  Allow syntax highlighting

cmd [[set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵]]

-------------------------------------------------------------------------------
-- Autocompletion
-------------------------------------------------------------------------------
opt.updatetime = 300  -- alows faster completion (4000ms default)

-- [[ Theme ]]
opt.termguicolors = true         -- bool: If term supports ui color then enable
-- cmd('colorscheme gruvbox-baby')       -- cmd:  Set the colorscheme

cmd('colorscheme ayu')       -- cmd:  Set the colorscheme
cmd('let ayucolor="dark"')

-------------------------------------------------------------------------------
-- lualine config
-------------------------------------------------------------------------------
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'molokai',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},

    component_separators = { '' },
    section_separators = { '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    -- lualine_c = {'filename'},
    lualine_c = {'%f'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
-------------------------------------------------------------------------------
-- Tree-sitter
-------------------------------------------------------------------------------

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "lua" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-------------------------------------------------------------------------------
-- statusline/winbar component that uses LSP to show your current code context
-------------------------------------------------------------------------------
-- local navic = require("nvim-navic")
-- 
-- require("lspconfig").clangd.setup {
--     on_attach = function(client, bufnr)
--         navic.attach(client, bufnr)
--     end
-- }

