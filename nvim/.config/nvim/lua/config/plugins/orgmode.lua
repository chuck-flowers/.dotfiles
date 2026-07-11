vim.pack.add({
	'https://github.com/nvim-orgmode/orgmode',
})

require('orgmode').setup({
	org_agenda_files = '~/org/**/*.org',
	org_agenda_custom_commands = {
		p = {
			description = 'Personal Tasks',
			types = {
				{
					type = 'agenda',
					org_agenda_category_filter_preset = '-work'
				},
			}
		},
		w = {
			description = 'Work Tasks',
			types = {
				{
					type = 'agenda',
					org_agenda_category_filter_preset = 'work'
				},
			}
		},
	},

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
	require('telescope.builtin').find_files({ cwd = '~/mnt/org', follow = true, hidden = true })
end)
