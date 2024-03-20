return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-context',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'nvim-treesitter/playground'
	},
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'awk',
				'bash',
				'c',
				'c_sharp',
				'css',
				'dockerfile',
				'dot',
				'gdscript',
				'graphql',
				'html',
				'javascript',
				'jq',
				'json',
				'jsonc',
				'lua',
				'markdown',
				'mermaid',
				'org',
				'python',
				'query',
				'sql',
				'rust',
				'tsx',
				'typescript',
				'vimdoc',
				'vue',
				'xml',
				'yaml'
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

		require('treesitter-context').setup()
	end
}
