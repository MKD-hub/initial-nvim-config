vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")
vim.cmd("set updatetime=5000")
vim.cmd("set mouse=")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.path:append { '.', 'src//' }
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

-- Go to file keyamps
vim.keymap.set('n', '<leader>gf', '<C-w>v gf<CR>', {noremap = true, silent = true}) -- open in a vertical split
vim.keymap.set('n', '<leader>gtf', ':tabnew <C-R>=expand("<cfile>")<CR><CR>', { noremap = true, silent = true }) -- open in new tab

-- Keymaps for tab management
vim.keymap.set('n', '<leader>n', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>x', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>]', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>[', ':tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>}', ':tabmove+<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>{', ':tabmove-<CR>', { noremap = true, silent = true })


-- keymaps for terminal windows
vim.keymap.set('n', '<leader>t', ':sp term://bash<CR>', { noremap = true, silent = true })
