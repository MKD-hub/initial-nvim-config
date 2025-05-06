return {
  "NTBBloodbath/zig-tools.nvim",
  dependencies = {
    "akinsho/toggleterm.nvim",
  }, 
  ft = "zig",
  config = function()
    require("zig-tools").setup()
  end,
}
