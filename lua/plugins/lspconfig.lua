return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  lazy = false,
  config = function()
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local function merge_with_capabilities(server_opts)
      local opts = vim.tbl_deep_extend("force", {}, server_opts)
      opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
      return opts
    end
    -- This is a common way to set up LSP servers with mason-lspconfig
    mason_lspconfig.setup {
      ensure_installed = {
        "biome", -- Ensure biome is in your installed list
        "lua_ls",
        "ast_grep",
        "stylua",
        "ts_ls",
        "zls",
        "vue_ls",
      },
      handlers = {
        -- Default handler for most servers
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = capabilities,
          }
        end,
        -- Custom handler for biome
        biome = function()
          lspconfig.biome.setup {
            -- Biome by default works with a biome.json file.
            -- You might want to enable single_file_support if you want biome to work
            -- on files without a biome.json in the project root.
            single_file_support = false, -- Set to true if you want biome to format/lint without a biome.json
            on_attach = function(client, bufnr)
              -- Optional: print a message when Biome attaches to a buffer
              print "Biome Attached"
              client.server_capabilities.documentFormattingProvider = true
            end,
            settings = {
              -- You can add specific Biome LSP settings here if needed,
              -- though biome.json usually handles most project-specific configurations.
            },
            capabilities = vim.tbl_deep_extend("force", {}, capabilities, {
              offset_encoding = "utf-8",
            }),
          }
        end,

        -- Custom handler for ts_ls ensures our max Vue filetypes and options are used.
        -- ts_ls = function()
        --   local ts_opts = merge_with_capabilities(require("lsp.ts_ls"))
        --   lspconfig.ts_ls.setup(ts_opts)
        -- end,
        --
        vue_ls = function()
          -- Merge the shared completion/formatting capabilities into the Vue-specific opts
          local vue_opts = merge_with_capabilities(require "lsp.vue_ls")
          -- Register the Vue language server with the merged config so `vls` is used
          lspconfig.vue_ls.setup(vue_opts)
        end,
      },
    }
  end,
}
