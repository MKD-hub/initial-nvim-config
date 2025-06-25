return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    { "<leader>fm", function() require("conform").format() end, mode = "n", desc = "Format buffer with Conform" },
  },
  opts = {
    formatters = {
      biome = {

      },
    },

    formatters_by_ft = {
      -- Use Biome For JS
      --
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      css = { "biome" },
      -- zig = { "zls" }
    },

    format_on_save = {
      lsp_fallback = true, -- Use LSP formatters as a fallback if no explicit conform formatter is found for the filetype
      async = false,       -- Format synchronously (prevents writing until formatting is done)
      timeout_ms = 1000,   -- Timeout for formatting (in milliseconds)
    }
  },
}
