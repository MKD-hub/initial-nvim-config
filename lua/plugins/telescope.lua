return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local config = require("telescope")
    local builtin = require("telescope.builtin")
    config.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules"
        }
      }
    })
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<C-u>', builtin.live_grep, {})
  end
}

