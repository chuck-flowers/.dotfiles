return {
	'numToStr/Comment.nvim',
	ft = {
		'cpp',
		'lua',
		'typescript'
	},
	config = function()
		local Comment = require('Comment')

		Comment.setup()
	end
}

