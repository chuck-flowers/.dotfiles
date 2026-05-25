vim.pack.add({
	'https://github.com/rcarriga/nvim-notify'
})

require('notify').setup({
	background_colour = require('gruvbox').palette.dark1,
})

vim.notify = require('notify')

