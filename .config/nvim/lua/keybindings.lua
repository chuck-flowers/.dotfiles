vim.g.mapleader = " "

-- Cycle through the quick fix list
vim.api.nvim_set_keymap('n', '<C-h>', ':cprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':cnext<CR>', { noremap = true })

-- Move lines of text
vim.api.nvim_set_keymap('n', '<C-j>', ':m+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':m-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-j>', ":'<'>m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', '<C-k>', ":'<'>m '<-2<CR>gv=gv", { noremap = true })

