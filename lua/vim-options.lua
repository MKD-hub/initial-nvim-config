vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")
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
