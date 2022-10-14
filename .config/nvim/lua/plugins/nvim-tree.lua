return {
	'nvim-tree/nvim-tree.lua',
	requires = {
		'nvim-tree/nvim-web-devicons'
	},
	config = function()
		local nvim_tree = nil
		local api = nil
		local function lazy_load()
			if nvim_tree == nil then
				nvim_tree = require('nvim-tree')
				nvim_tree.setup({})

				api = require('nvim-tree.api')
			end
		end

		vim.keymap.set('n', '<Leader>nn', function()
			lazy_load()

			local current_dir = vim.fn.getcwd()
			api.tree.toggle(false, false, current_dir)
		end)
		vim.keymap.set('n', '<Leader>nf', function()
			lazy_load()

			local curr_file = vim.fn.bufname()
			api.tree.open(vim.fn.getcwd())
			api.tree.find_file(curr_file)
		end)
		vim.keymap.set('n', '<Leader>nr', function ()
			lazy_load()
			api.tree.reload()
		end)

	end
}
