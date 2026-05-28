return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      custom_highlights = function(colors)
        return {
          ["@comment.documentation"] = { fg = colors.orange, style = { "italic" } },
        }
      end,
    }

    vim.cmd.colorscheme "catppuccin"
  end,
}
