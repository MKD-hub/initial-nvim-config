return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      "<leader>fm",
      function() require("conform").format() end,
      mode = "n",
      desc = "Format buffer with Conform",
    },
  },
  opts = {
    formatters = {
      biome = {},
      stylua = {},
      prettier = {},
      zls = {
        command = "/home/mkd/zls/zls",
        formatWithErrors = true,
      },
      gofmt = {},
    },

    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biome", "prettier", stop_after_first = true },
      typescript = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      zig = { "zls", lsp_format = "prefer" },
      go = { "goimports", "gofmt" },
    },

    stop_after_first = false,

    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  },
}
