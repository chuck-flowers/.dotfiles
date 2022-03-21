return {
	'wbthomason/packer.nvim',
	config = function()
		vim.api.nvim_set_keymap('n', '<Leader>ps', '<cmd>PackerStatus<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>pc', '<cmd>PackerCompile<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>pi', '<cmd>PackerInstall<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>pu', '<cmd>PackerUpdate<CR>', { noremap = true })
	end
}

