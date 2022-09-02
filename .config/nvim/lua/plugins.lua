-- [[ plugins.lua ]]

return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- THEMES
  use 'luisiacc/gruvbox-baby' -- Theme
  use 'ayu-theme/ayu-vim'

  -- LSP and CMP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-path' -- Path completion
  use 'hrsh7th/cmp-nvim-lsp' -- completion for Lsp
  use 'hrsh7th/cmp-nvim-lua' -- completion for Lsp
  use 'hrsh7th/cmp-buffer' -- Buffet completion

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip' -- Lua completion

  -- STATUS LINE
  use 'nvim-lualine/lualine.nvim'

  -- Tree-siter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  -- Display vertical line at each indentation level
  use   'Yggdroot/indentLine'
end)
