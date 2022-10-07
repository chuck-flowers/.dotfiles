vim.g.mapleader = " "

-- Cycle through diagnostics
vim.keymap.set('n', '<C-l>', vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set('n', '<C-h>', vim.diagnostic.goto_prev, { noremap = true })

-- Move lines of text
vim.keymap.set('n', '<C-j>', ':m+1<CR>==', { noremap = true })
vim.keymap.set('n', '<C-k>', ':m-2<CR>==', { noremap = true })
vim.keymap.set('v', '<C-j>', ":'<'>m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', '<C-k>', ":'<'>m '<-2<CR>gv=gv", { noremap = true })

-- Tweaks the behavior of the scrolling behavior
vim.keymap.set('n', '<C-f>', '<C-f>M', { noremap = true })
vim.keymap.set('n', '<C-b>', '<C-b>M', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>M', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>M', { noremap = true })

-- Allows for reloading config
vim.keymap.set('n', '<leader><leader>so', function ()
	package.loaded = {}
	vim.cmd('source ~/.config/nvim/init.lua')
end)

