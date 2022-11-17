return {
	'ellisonleao/gruvbox.nvim',
	config = function()
		local gruvbox = require 'gruvbox'

		gruvbox.setup({
			transparent_mode = true
		})

		vim.opt.termguicolors = true
		vim.o.background = 'dark'
		vim.cmd('colorscheme gruvbox')
	end
}

