return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      -- This runs ruff check --fix and ruff format
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    },
    format_on_save = {
      skip_format_metadata = true,
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
