vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")
vim.cmd("set updatetime=5000")
vim.cmd("set mouse=")
vim.g.mapleader = " "

-- paste
vim.keymap.set(
   'n',
   '<leader>v',
   '"+P',
   {}
)

-- copy
vim.keymap.set(
   'v',
   '<leader>c',
   '"+Y',
   {}
)

-- copy single line
vim.keymap.set(
   'n',
   '<leader>cl',
   '"+y$',
   {}
)

-- Keymaps for tab management
vim.keymap.set('n', '<leader>n', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>x', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>]', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>[', ':tabprevious<CR>', { noremap = true, silent = true })
