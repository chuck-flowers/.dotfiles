return {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	requires = {
		'nvim-treesitter/nvim-treesitter-context'
	},
	config = function()
		local ts_configs = require('nvim-treesitter.configs')
		local ts_context = require('treesitter-context')

		ts_configs.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { 'org' }
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = 'gnn',
					scope_incremental = 'grc',
					node_incremental = '<C-L>',
					node_decremental = '<C-H>'
				}
			},
			ensure_installed = {
				'lua',
				'org',
				'tsx',
				'typescript'
			}
		})

		ts_context.setup()
	end
}

