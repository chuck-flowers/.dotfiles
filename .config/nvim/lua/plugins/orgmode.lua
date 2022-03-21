return {
	'nvim-orgmode/orgmode',
	requires = {
		{ 'nvim-treesitter/nvim-treesitter' }
	},
	config = function()
		local orgmode = require('orgmode')

		orgmode.setup({

		})
	end
}

