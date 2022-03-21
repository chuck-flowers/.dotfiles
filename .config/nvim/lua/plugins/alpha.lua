return {
	'goolord/alpha-nvim',
	config = function()
		local alpha = require('alpha')
		local alpha_startify = require('alpha.themes.startify')

		vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Alpha<CR>', { noremap = true })

		alpha.setup(alpha_startify.config)
	end
}

