vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")
vim.cmd("set updatetime=5000")
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

