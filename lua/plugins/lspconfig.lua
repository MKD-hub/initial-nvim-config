return {
  "neovim/nvim-lspconfig",
  lazy = false,

  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    lspconfig.volar.setup({})

    -- This is a common way to set up LSP servers with mason-lspconfig
    mason_lspconfig.setup({
      ensure_installed = {
        "biome",                      -- Ensure biome is in your installed list
        "zls",
        "vue_ls",
      },
      handlers = {
        -- Default handler for most servers
        function(server_name)
          lspconfig[server_name].setup({})
        end,
        -- Custom handler for biome
        biome = function()
          lspconfig.biome.setup({
            -- Biome by default works with a biome.json file.
            -- You might want to enable single_file_support if you want biome to work
            -- on files without a biome.json in the project root.
            single_file_support = false,       -- Set to true if you want biome to format/lint without a biome.json
            on_attach = function(client, bufnr)
              -- Optional: print a message when Biome attaches to a buffer
            end,
            settings = {
              -- You can add specific Biome LSP settings here if needed,
              -- though biome.json usually handles most project-specific configurations.
            },
          })
        end,
      },
    })
  end

}
