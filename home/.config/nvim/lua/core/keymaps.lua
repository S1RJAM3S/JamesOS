vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<Leader>pv', function() vim.cmd.Ex() end, { desc = "Project View (NetRW)" })
