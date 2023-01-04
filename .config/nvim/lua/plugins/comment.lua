return {
	'numToStr/Comment.nvim',
	ft = {
		'typescript'
	},
	config = function()
		local Comment = require('Comment')

		Comment.setup()
	end
}

