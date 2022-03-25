return {
	'kyazdani42/nvim-tree.lua',
	requires = {
		'kyazdani42/nvim-web-devicons'
	},
	config = function()
		local nvim_tree = require('nvim-tree')

		vim.api.nvim_set_keymap('n', '<Leader>nn', '<cmd>NvimTreeToggle<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>nf', '<cmd>NvimTreeFindFile<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>nr', '<cmd>NvimTreeRefresh<CR>', { noremap = true })

		nvim_tree.setup({})
	end
}
