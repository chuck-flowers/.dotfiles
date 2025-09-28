return {
	'vuki656/package-info.nvim',
	lazy = false,
	dependencies = {
		'MunifTanjim/nui.nvim',
		'ellisonleao/gruvbox.nvim'
	},
	ft = 'json',
	config = function()
		require('package-info').setup({
			package_manager = 'pnpm',
			highlights = {
				up_to_date = { fg = require('gruvbox').palette.dark_green },
				outdated = { fg = require('gruvbox').palette.faded_yellow },
				invalid = { fg = require('gruvbox').palette.dark_red },
			},
		})

		-- Install
		vim.keymap.set('n', '<leader>di', require('package-info').install)

		-- Uninstall
		vim.keymap.set('n', '<leader>dr', require('package-info').delete)

		-- Update
		vim.keymap.set('n', '<leader>du', require('package-info').update)

		-- Change
		vim.keymap.set('n', '<leader>dc', require('package-info').change_version)
	end
}
