return { 
  "neovim/nvim-lspconfig", 
  lazy = false,

  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.volar.setup({})
  end

}
