vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.keymap.set(
   'n', 
   '<leader>v', 
   vim.cmd([[
      let @" = system('xclip -o')
   ]]), -- using xclip to copy to the clipboard at register @" the default register
   {}
);

