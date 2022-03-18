local lualine = require('lualine')

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		globalstatus = true
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'filename' },
		lualine_c = { 'progress', 'location' },
		lualine_x = { 'branch', 'diff', 'diagnostics' },
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {},
	tabline = {},
	extensions = {}
})

