return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig"
  },

  config = function()
    local config = require("mason-lspconfig")
    config.setup()
  end

}
