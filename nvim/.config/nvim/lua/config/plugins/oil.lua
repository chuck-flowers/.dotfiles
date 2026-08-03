vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

require('oil').setup({
	columns = {
		'icon',
		'permissions',
	},
	view_options = {
		show_hidden = true,
	},
})

vim.keymap.set('n', '<leader>xx', ':Oil<cr>')
vim.keymap.set('n', '<leader>xv', '<C-w>v:Oil<cr>')
vim.keymap.set('n', '<leader>xs', '<C-w>s:Oil<cr>')
