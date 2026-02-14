
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 
	'nvim-lua/plenary.nvim',
	{'nvim-telescope/telescope-fzf-native.nvim' , build = 'make' }
    },
    config = function()
	require('telescope').setup {
	    -- pickers = {
	    --     find_files = {
	    --         theme = ""
	    --     }
	    -- },
	    extensions = {
		fzf = {}
	    }
	}
	require('telescope').load_extension('fzf')

	vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
	vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
	vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep)
	vim.keymap.set("n", "<leader>fb", require('telescope.builtin').buffers)
    -- Custom function to search .config/nvim directory
	vim.keymap.set("n", "<leader>en", function()
	    require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath("config")
	    }
	end)

	vim.keymap.set("n", "<leader>gd", require('telescope.builtin').lsp_definitions)
	vim.keymap.set("n", "<leader>gr", require('telescope.builtin').lsp_references)
    require("config.telescope.activesearch").setup()
  end
}
