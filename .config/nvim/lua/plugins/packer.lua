return {
	'wbthomason/packer.nvim',
	config = function()
		vim.keymap.set('n', '<Leader>ps', '<cmd>PackerStatus<CR>')
		vim.keymap.set('n', '<Leader>pc', '<cmd>PackerCompile<CR>')
		vim.keymap.set('n', '<Leader>pi', '<cmd>PackerInstall<CR>')
		vim.keymap.set('n', '<Leader>pu', '<cmd>PackerSync<CR>')
		vim.keymap.set('n', '<leader>pp', '<cmd>PackerProfile<CR>')
	end
}

