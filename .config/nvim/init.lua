require('autocmd')
require('keybindings')

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
vim.o.shiftround = true

-- Configure search behavior
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure the line wrapping behavior
vim.o.wrap = false

-- Configure terminal
vim.o.termguicolors = true
vim.o.shell = '/usr/bin/env bash --login'

-- Configure splitting behavior
vim.o.splitbelow = true
vim.o.splitright = true

local lazypath = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require('editorconfig')

require('lazy').setup('plugins', {
	ui = {
		border = 'rounded'
	}
})
