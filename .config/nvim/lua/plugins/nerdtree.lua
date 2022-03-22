return {
	'preservim/nerdtree',
	config = function()
		vim.api.nvim_set_keymap('n', '<Leader>nn', ':NERDTreeToggle<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>nc', ':NERDTreeClose<CR>', { noremap = true })
	end
}

