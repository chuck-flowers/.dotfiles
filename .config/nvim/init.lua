require('autocmd')
require('keybindings')
require('plugins')

-- Show line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Configures the global status line
vim.o.laststatus = 3

-- Configure tabbing behavior
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Configure search behavior
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure the line wrapping behavior
vim.o.wrap = false

-- Configure terminal colors
vim.o.termguicolors = true
