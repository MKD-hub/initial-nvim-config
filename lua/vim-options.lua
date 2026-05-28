vim.cmd "set softtabstop=2"
vim.cmd "set shiftwidth=2"
vim.cmd "set updatetime=5000"
vim.cmd "set mouse="
vim.cmd "set number"
vim.cmd "set relativenumber"
vim.opt.path:append { ".", "src//" }
vim.g.mapleader = " "

-- folding expressions
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- keep everything unfolded by default
vim.opt.foldenable = true

-- Key-bindings for termbuffer exit <leader>wn
vim.cmd "tnoremap <Esc> <C-\\><C-n><C-w>w"

-- paste
vim.keymap.set("n", "<leader>v", '"+P', {})

-- copy
vim.keymap.set("v", "<leader>c", '"+Y', {})

-- copy single line
vim.keymap.set("n", "<leader>cl", '"+y$', {})

-- Go to file keyamps
vim.keymap.set("n", "<leader>gf", "<C-w>v gf<CR>", { noremap = true, silent = true }) -- open in a vertical split
vim.keymap.set("n", "<leader>gtf", ':tabnew <C-R>=expand("<cfile>")<CR><CR>', { noremap = true, silent = true }) -- open in new tab

-- Keymaps for tab management
vim.keymap.set("n", "<leader>n", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>x", ":tabclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>]", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>[", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>}", ":tabmove+<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>{", ":tabmove-<CR>", { noremap = true, silent = true })

-- keymaps for terminal windows
vim.keymap.set("n", "<leader>t", ":sp term://bash<CR>", { noremap = true, silent = true })

-- show floating error
vim.keymap.set("n", "K", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
vim.keymap.set("n", "<leader>h", function()
  vim.lsp.buf.hover()
  vim.defer_fn(function() pcall(vim.treesitter.stop) end, 50)
end, { desc = "Show documentation hover (safe)" })

-- intercept terminal requests and add sign
vim.api.nvim_create_autocmd("TermOpen", {
  command = "setlocal signcolumn=auto",
})
local ns = vim.api.nvim_create_namespace "my.terminal.prompt"
vim.api.nvim_create_autocmd("TermRequest", {
  callback = function(args)
    if string.match(args.data.sequence, "^\027]133;A") then
      local lnum = args.data.cursor[1]
      vim.api.nvim_buf_set_extmark(args.buf, ns, lnum - 1, 0, {
        sign_text = "▶",
        sign_hl_group = "SpecialChar",
      })
    end
  end,
})
