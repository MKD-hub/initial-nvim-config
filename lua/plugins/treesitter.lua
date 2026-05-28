return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "neovim-treesitter/treesitter-parser-registry" },
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  -- config = function()
  --   local config = require "nvim-treesitter.config"
  --   config.setup {
  --     ensure_installed = { "glsl", "python", "markdown", "lua", "javascript", "vue", "typescript", "go", "zig" },
  --     highlight = { enable = false, additional_vim_regex_highlighting = false },
  --     indent = { enable = true, disable = { "typescript" } },
  --   }
  -- end,
}
