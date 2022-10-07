require('keybindings')
require('plugins')

-- Show line numbers
vim.go.number = true
vim.go.relativenumber = true
vim.go.cursorline = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Configure tabbing behavior
vim.go.tabstop = 4
vim.go.autoindent = true
vim.go.softtabstop = 4
vim.go.shiftwidth = 4

-- Configure the line wrapping behavior
vim.go.wrap = false

