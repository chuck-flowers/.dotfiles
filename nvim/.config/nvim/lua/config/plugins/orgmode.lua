vim.pack.add({
	'https://github.com/nvim-orgmode/orgmode',
})

require('orgmode').setup({
	org_agenda_files = '~/org/**/*.org',
	org_default_notes_file = '~/org/notes.org',
	org_startup_indented = true,
	org_adapt_indentation = false,
	org_indent_mode_turns_on_hiding_stars = false,
	org_custom_exports = {
		-- TODO
	},
	calendar_week_start_day = 0,
	org_agenda_span = 'day',
})

vim.keymap.set('n', '<leader>fo', function()
	require('telescope.builtin').find_files({ cwd = '~/org', follow = true, hidden = true })
end)
