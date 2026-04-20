local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

vim.cmd [[
  filetype plugin indent on
  syntax enable
]]

vim.notify("NEOVIM STARTED", vim.log.levels.INFO)
-- vim.lsp.enable "stylua"
-- vim.lsp.enable "lua_ls"
-- vim.lsp.enable "ts_ls"
-- vim.lsp.enable "vue_ls"
-- vim.lsp.config["vue_ls"] = {}
-- vim.lsp.config["ts_ls"] = ts_ls_config
-- vim.lsp.enable { "ts_ls", "vue_ls" }

require "vim-options"
require "treesitter_stop"
require("lazy").setup "plugins"
