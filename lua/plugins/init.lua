-- ~/.config/nvim/lua/plugins/init.lua
-- Collect every spec file in the same directory and return them as a list.
local specs = {}

-- List every spec file you have (order is not critical unless you have dependencies).
local files = {
  "catppuccin",
  "conform",
  "debugging",
  "git",
  "live_server",
  "lspconfig",
  "lualine",
  "mason-lspconfig",
  "neotree",
  "nvim-cmp",
  "telescope",
  "toggleterm",
  "treesitter", -- ← this is the file you already looked at
}

for _, name in ipairs(files) do
  specs[#specs + 1] = require("plugins." .. name) -- each file returns a spec table
end

return specs
