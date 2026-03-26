return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- load before saving
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      json = { "jq" },
      html = { "prettier" },
      css = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
