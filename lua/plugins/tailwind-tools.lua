
return { 
  "luckasRanarison/tailwind-tools.nvim",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "neovim/nvim-lspconfig" 
  }, 
  opts = {},
  config = function() 
    local config = require("nvim-treesitter.configs")
  end
}        
