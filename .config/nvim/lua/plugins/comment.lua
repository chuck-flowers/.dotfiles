return {
	'numToStr/Comment.nvim',
	ft = {
		'cpp',
		'lua',
		'make',
		'sh',
		'typescript',
		'yaml'
	},
	config = function()
		local Comment = require('Comment')

		Comment.setup()
	end
}

