-- Stop treesitter when any buffer opens to avoid highlighting issues
-- Uses an autocommand that runs once on the first buffer event.

local stopped = false
local function stop_treesitter()
  if stopped then return end
  stopped = true
  if vim.treesitter and vim.treesitter.stop then
    pcall(vim.treesitter.stop)
  end
end

vim.api.nvim_create_autocmd({"VimEnter", "BufWinEnter", "BufReadPost", "BufNewFile"}, {
  pattern = {"*"},
  callback = stop_treesitter,
  once = true,
})

-- no public API needed
return {}
