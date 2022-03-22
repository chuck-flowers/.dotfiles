return {
	'nvim-orgmode/orgmode',
	requires = {
		{ 'nvim-treesitter/nvim-treesitter' }
	},
	config = function()
		local orgmode = require('orgmode')

		orgmode.setup_ts_grammar()

		orgmode.setup({
			org_agenda_files = {
				'~/org/*'
			},
			org_default_notes_file = '~/org/notes.org'
		})
	end
}

