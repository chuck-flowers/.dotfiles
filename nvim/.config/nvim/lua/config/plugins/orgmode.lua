vim.pack.add({
	'https://github.com/nvim-orgmode/orgmode',
})

require('orgmode').setup({
	org_agenda_files = '~/org/**/*.org',
	org_default_notes_file = '~/org/notes.org',
})

vim.keymap.set('n', '<leader>fo', function()
	require('telescope.builtin').find_files({ cwd = '~/org', follow = true, hidden = true })
end)
