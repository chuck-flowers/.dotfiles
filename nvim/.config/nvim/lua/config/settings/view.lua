-- Enable UI2
require('vim._core.ui2').enable({
	enable = true
})

-- Status Line
vim.o.laststatus = 3

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Highlight Line
vim.o.cursorline = true

-- Disable Line Wrapping
vim.o.wrap = false

-- Windowing
vim.o.winborder = 'rounded'
vim.o.splitbelow = true
vim.o.splitright = true

