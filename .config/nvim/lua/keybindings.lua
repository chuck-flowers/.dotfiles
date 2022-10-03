vim.g.mapleader = " "

-- Cycle through diagnostics
vim.keymap.set('n', '<C-l>', vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set('n', '<C-h>', vim.diagnostic.goto_prev, { noremap = true })

-- Move lines of text
vim.api.nvim_set_keymap('n', '<C-j>', ':m+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':m-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-j>', ":'<'>m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', '<C-k>', ":'<'>m '<-2<CR>gv=gv", { noremap = true })

-- Tweaks the behavior of the scrolling behavior
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>M', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>M', { noremap = true })
