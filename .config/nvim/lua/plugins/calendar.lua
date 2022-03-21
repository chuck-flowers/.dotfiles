return {
	'itchyny/calendar.vim',
	config = function()
		vim.api.nvim_set_keymap('n', '<Leader>c', ':Calendar<CR>', { noremap = true })
	end
}

