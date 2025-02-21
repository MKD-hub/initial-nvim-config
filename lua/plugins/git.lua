return {
  {
    "tpope/vim-fugitive",

    vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', {}),
    vim.keymap.set('n', '<leader>gs', ':Git status<CR>', {}),
    vim.keymap.set('n', '<leader>gp', ':Git pull<CR>', {}),
    vim.keymap.set('n', '<leader>gps', ':Git push<CR>', {})
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup()
  
      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
      vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', {})
    end
  }
}
