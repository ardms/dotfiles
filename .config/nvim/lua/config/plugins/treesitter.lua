---@type table
local treesitter_config = {
	    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "latex"},

	    sync_install = false,

	    auto_install = true,

	    ignore_install = { "javascript" },

	    highlight = { enable = true },
     }
return {

    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.install").prefer_git = true
      require("nvim-treesitter.configs").setup( treesitter_config )
    end,
}
