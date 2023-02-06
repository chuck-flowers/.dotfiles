return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	config = function()
		require('nvim-tree').setup({})
	end,
	keys = {
		{
			'<leader>nn', function()
				local current_dir = vim.fn.getcwd()
				require('nvim-tree.api').tree.toggle(false, false, current_dir)
			end
		},
		{
			'<leader>nf', function()
				local curr_file = vim.fn.bufname()
				require('nvim-tree.api').tree.open(vim.fn.getcwd())
				require('nvim-tree.api').tree.find_file(curr_file)
			end
		},
		{
			'<leader>nr', function()
				require('nvim-tree.api').tree.reload()
			end
		}
	}
}
