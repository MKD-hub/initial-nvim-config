return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    lazy = false,
    config = function()
        local lspconfig = require "lspconfig"
        local mason_lspconfig = require "mason-lspconfig"
        -- local capabilities = require("cmp_nvim_lsp").default_capabilities();
        -- This is a common way to set up LSP servers with mason-lspconfig
        mason_lspconfig.setup {
            ensure_installed = {
                "biome", -- Ensure biome is in your installed list
                "lua_ls",
                "stylua",
                "ts_ls",
                "zls",
            },
            handlers = {
                -- Default handler for most servers
                function(server_name)
                    lspconfig[server_name].setup {
                        -- capabilities = capabilities;
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
                        end,
                        settings = {
                            -- You can add specific Biome LSP settings here if needed,
                            -- though biome.json usually handles most project-specific configurations.
                        },
                    }
                end,
                ["ts_ls"] = function() lspconfig.ts_ls.setup {} end,
            },
        }
    end,
}
