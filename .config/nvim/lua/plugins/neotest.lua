return {
	'nvim-neotest/neotest',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'antoinemadec/FixCursorHold.nvim',

		'marilari88/neotest-vitest'
	},
	config = function()
		local neotest = require 'neotest'

		neotest.setup({
			adapaters = {
				require('neotest-vitest')
			}
		})
	end
}
