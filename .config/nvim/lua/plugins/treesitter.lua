return {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate',
	requires = {
		'nvim-treesitter/nvim-treesitter-context',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'nvim-treesitter/playground'
	},
	config = function()
		local ts_configs = require('nvim-treesitter.configs')
		local ts_context = require('treesitter-context')

		ts_configs.setup({
			ensure_installed = {
				'lua',
				'query',
				'org',
				'tsx',
				'typescript'
			},
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
			playground = {
				enable = true
			},
			textobjects = {
				select = {
					enable = true,
					keymaps = {
						-- Functions
						['af'] = '@function.outer',
						['if'] = '@function.inner',

						-- Classes
						['ac'] = '@class.outer',
						['ic'] = '@class.inner'
					}
				},
				swap = {},
				move = {}
			}
		})

		ts_context.setup()
	end
}

