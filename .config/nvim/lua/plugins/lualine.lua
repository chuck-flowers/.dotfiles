return {
	'nvim-lualine/lualine.nvim',
	requires = {
		'nvim-tree/nvim-web-devicons'
	},
	config = function()
		local lualine = require('lualine')

		-- lualine.setup({
		-- 	options = {
		-- 		icons_enabled = true,
		-- 		theme = 'auto',
		-- 		globalstatus = true
		-- 	},
		-- 	sections = {
		-- 		lualine_a = { 'mode' },
		-- 		lualine_b = { 'progress', 'location' },
		-- 		lualine_c = {},
		-- 		lualine_x = {},
		-- 		lualine_y = { 'diagnostics' },
		-- 		lualine_z = { 'branch', 'diff' }
		-- 	},
		-- 	inactive_sections = {},
		-- 	winbar = {
		-- 		lualine_a = { 'filename', 'filetype' }
		-- 	},
		-- 	extensions = {}
		-- })
	end
}
