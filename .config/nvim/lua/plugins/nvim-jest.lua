return {
	'chuck-flowers/jest.nvim',
	ft = {
		'javascript',
		'typescript'
	},
	config = function ()
		local jest = require('jest')
		jest.setup()
	end
}

