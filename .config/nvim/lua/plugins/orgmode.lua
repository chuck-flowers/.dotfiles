return {
	'chuck-flowers/logging-config',
	branch = 'master',
	requires = {
		{ 'nvim-treesitter/nvim-treesitter' }
	},
	config = function()
		local orgmode = require('orgmode')

		orgmode.setup_ts_grammar()

		orgmode.setup({
			calendar_week_start_day = 0,
			org_agenda_files = '~/org/**/*',
			org_agenda_span = 'day',
			org_agenda_skip_deadline_if_done = true,
			org_agenda_skip_scheduled_if_done = true,
			org_agenda_start_on_weekday = 0,
			org_capture_templates = {
				p = {
					description = 'Personal Task',
					template = '* TODO %?\n  SCHEDULED: %t',
					target = '~/org/todos.org',
					headline = 'Personal Tasks'
				},
				w = {
					description = 'Work Task',
					template = '* TODO %?\n  SCHEDULED: %t',
					target = '~/org/work.org',
					headline = 'Unfiled Tasks'
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
							vim.fn.system({
								'xdg-open',
								target
							})
						end
						local on_error = function(err)
							print('Error!')
							vim.api.nvim_echo({{ table.concat(err, '\n'), 'ErrorMsg' }}, true, {})
						end
						return exporter(command, target, on_success, on_error)
					end
				}
			},
			org_default_notes_file = '~/org/notes.org',
			org_indent_mode = 'indent'
		})
	end
}

