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
			org_agenda_start_on_weekday = 0,
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
			org_custom_exports = {
				H = {
					label = 'Export to Custom HTML',
					action = function(exporter)
						local current_file = vim.api.nvim_buf_get_name(0)
						local target = vim.fn.fnamemodify(current_file, ':p:r')..'.html'
						local command = { 'pandoc', '-L', 'diagram-generator.lua', '-s', '--self-contained', current_file, '-o', target }
						local on_success = function(output)
							print('Success!')
							vim.api.nvim_echo({{ table.concat(output, '\n') }}, true, {})
						end
						local on_error = function(err)
							print('Error!')
							vim.api.nvim_echo({{ table.concat(err, '\n'), 'ErrorMsg' }}, true, {})
						end
						return exporter(command , target, on_success, on_error)
					end
				}
			},
			org_default_notes_file = '~/org/notes.org',
			org_indent_mode = 'indent'
		})
	end
}

