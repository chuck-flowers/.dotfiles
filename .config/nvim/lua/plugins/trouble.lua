return {
	'folke/trouble.nvim',
	config = function()
		local trouble = require('trouble')

		vim.api.nvim_set_keymap('n', '<Leader>tt', '<cmd>TroubleToggle<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>tw', '<cmd>TroubleToggle workspace_diagnostics<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>tq', '<cmd>TroubleToggle quickfix<CR>', { noremap = true })

		trouble.setup({

		})
	end
}

