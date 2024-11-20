return {
   'barrett-ruth/live-server.nvim',
   build = 'npm install -g live-server',
   cmd = { 'LiveServerStart', 'LiveServerStop' },
   config = true,
   vim.keymap.set("n", "<leader>ss", ":LiveServerStart<CR>", {}),
   vim.keymap.set("n", "<leader>st", ":LiveServerStop<CR>", {})
}
