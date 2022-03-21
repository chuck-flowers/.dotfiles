return {
	'ellisonleao/gruvbox.nvim',
	config = function()
		vim.opt.termguicolors = true
		vim.o.background = 'dark'
		vim.cmd('colorscheme gruvbox')
	end
}

