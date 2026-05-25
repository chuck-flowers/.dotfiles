vim.pack.add({
	'https://github.com/chuck-flowers/align-selection.nvim',
})

vim.keymap.set('v', 'zz', require('align-selection').center)
