return {
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    {
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
		    library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		    },
		},
	    },
	},
	config = function()
	    local capabilities = require('blink.cmp').get_lsp_capabilities()
	    require("lspconfig").lua_ls.setup { capabilities = capabilities }
	    -- vim.lsp.enable('pyright')
	    require("lspconfig").pyright.setup({
		capabilities = capabilities,
		on_attach = function(client)
		    client.server_capabilities.implementationProvider = true
		end})
		-- require("lspconfig").pylsp.setup({
		    --     capabilities = capabilities
		    -- })
	    require("lspconfig").texlab.setup({
		capabilities = capabilities
	    })
	    vim.lsp.enable('marksman')

		end,
	    }
	}
