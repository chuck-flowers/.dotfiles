return {
	'stevearc/oil.nvim',
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require('oil').setup()
	end,
	keys = {
		{ '<leader>x.', function() require('oil').open() end }
	}
}
