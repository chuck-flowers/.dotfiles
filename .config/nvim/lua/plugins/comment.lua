return {
	'numToStr/Comment.nvim',
	ft = {
		'cpp',
		'lua',
		'make',
		'typescript'
	},
	config = function()
		local Comment = require('Comment')

		Comment.setup()
	end
}

