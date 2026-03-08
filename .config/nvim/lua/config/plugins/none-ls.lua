return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- This automatically looks for [tool.mypy] in your pyproject.toml
        null_ls.builtins.diagnostics.mypy.with({
          extra_args = { "--config-file", "pyproject.toml" },
        }),
      },
    })
  end,
}
