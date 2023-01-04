return {
	'numToStr/Comment.nvim',
	ft = {
		'lua',
		'typescript'
	},
	config = function()
		local Comment = require('Comment')

		Comment.setup()
	end
}

