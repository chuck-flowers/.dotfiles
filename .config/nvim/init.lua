require('keybindings')
require('plugins')

-- Show line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Configure color scheme
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- Configure tabbing behavior
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Configure the line wrapping behavior
vim.o.wrap = false

