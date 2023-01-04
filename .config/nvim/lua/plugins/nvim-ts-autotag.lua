return {
	'windwp/nvim-ts-autotag',
	requires = {
		'nvim-treesitter/nvim-treesitter'
	},
	ft = {
		'html',
		'xml'
	},
	config = function ()
		local ts_autotag = require 'nvim-ts-autotag'

		ts_autotag.setup({})
	end
}
