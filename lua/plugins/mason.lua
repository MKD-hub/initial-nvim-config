return {
  "williamboman/mason.nvim",
  lazy = false,

  config = function()
    local config = require("mason")
    config.setup()
  end

}
