return {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	config = function()
		local ts_configs = require('nvim-treesitter.configs')

		ts_configs.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { 'org' }
			},
			ensure_installed = { 'org' }
		})
	end
}

