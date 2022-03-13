vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<C-h>', ':cprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':cnext<CR>', { noremap = true })
