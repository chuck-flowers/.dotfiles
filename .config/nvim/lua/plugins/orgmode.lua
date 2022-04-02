return {
	'nvim-orgmode/orgmode',
	requires = {
		{ 'nvim-treesitter/nvim-treesitter' }
	},
	config = function()
		local orgmode = require('orgmode')

		orgmode.setup_ts_grammar()

		orgmode.setup({
			org_agenda_files = '~/org/**/*',
			org_agenda_span = 'day',
			org_agenda_skip_deadline_if_done = true,
			org_agenda_skip_scheduled_if_done = true,
			org_agenda_start_day = 0,
			org_agenda_templates = {
				t = {
					description = 'Task',
					template = '* TODO %?\n  %t',
					target = '~/org/todos.org'

				},
				j = {
					description = 'Journal',
					template = '*** %u\n  %?',
					target = '~/org/journal-current-month.org'
				}
			},
			org_default_notes_file = '~/org/notes.org'
		})
	end
}

