return {
	'kyazdani42/nvim-tree.lua',
	requires = {
		'kyazdani42/nvim-web-devicons'
	},
	config = function()
		local nvim_tree = require('nvim-tree')
		local api = require('nvim-tree.api')

		vim.keymap.set('n', '<Leader>nn', function()
			api.tree.toggle(false, false, vim.fn.getcwd())
		end)
		vim.keymap.set('n', '<Leader>nf', function()
			local curr_file = vim.fn.bufname()
			api.tree.open()
			api.tree.find_file(curr_file)
		end)
		vim.keymap.set('n', '<Leader>nr', function ()
			api.tree.reload()
		end)

		nvim_tree.setup({})
	end
}
