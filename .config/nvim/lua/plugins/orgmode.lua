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
			org_default_notes_file = '~/org/notes.org',
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
			}
		})
	end
}

