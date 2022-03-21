return {
	'folke/trouble.nvim',
	config = function()
		local trouble = require('trouble')

		vim.api.nvim_set_keymap('n', '<Leader>t', '<cmd>TroubleToggle<CR>', { noremap = true })

		trouble.setup({

		})
	end
}

