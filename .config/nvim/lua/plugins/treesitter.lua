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
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = 'gnn',
					node_incremental = 'grn',
					scope_incremental = 'grc',
					node_decremental = 'grm'
				}
			},
			ensure_installed = {
				'lua',
				'org',
				'tsx',
				'typescript'
			}
		})
	end
}

