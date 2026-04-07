vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
})

require('telescope').setup()

vim.keymap.set('n', '<leader>ff', function ()
	require('telescope.builtin').find_files({ follow = true, hidden = true })
end)

vim.keymap.set('n', '<leader>ft', function ()
	require('telescope.builtin').live_grep()
end)

vim.keymap.set('n', '<leader>fh', function ()
	require('telescope.builtin').help_tags()
end)

