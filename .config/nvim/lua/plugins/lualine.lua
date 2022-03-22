return {
	'nvim-lualine/lualine.nvim',
	config = function()
		local lualine = require('lualine')

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = 'auto',
				globalstatus = true
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'filename', 'progress', 'location' },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { 'branch', 'diff', 'diagnostics' },
			},
			inactive_sections = {},
			tabline = {},
			extensions = {}
		})
	end
}

