vim.pack.add({
	'https://github.com/nvim-telescope/telescope.nvim',
	"https://github.com/pwntester/octo.nvim",
})

require('octo').setup({
	enable_builtin = true,
	poll = {
		enabled = true,
		interval = 10 * 1000,
	},
})

vim.keymap.set('n', '<leader>hh', '<cmd>Octo<cr>')
vim.keymap.set('n', '<leader>hr', '<cmd>Octo run list<cr>')
