return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'nvim-telescope/telescope-project.nvim' }
	},
	config = function()
		print('Configuring telescope')

		local telescope = require 'telescope'

		telescope.load_extension('project')
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					'node_modules',
					'.git'
				}
			}
		})

	end,
	keys = {
		{
			'<leader>ff', function()
				require('telescope.builtin').find_files()
			end, desc = "Find File"
		},
		{
			'<Leader>fb', function()
				require('telescope.builtin').buffers({})
			end
		},
		{
			'<Leader>ft', function()
				require('telescope.builtin').live_grep({})
			end
		},
		{
			'<Leader>fh', function()
				require('telescope.builtin').help_tags({})
			end
		},
		{
			'<Leader>fp', function()
				require('telescope').extensions.project.project({})
			end
		},
		{
			'<Leader>fs', function()
				require('telescope.builtin').lsp_dynamic_workspace_symbols({})
			end
		},
		{
			'<Leader>fm', function()
				require('telescope.builtin').man_pages({})
			end
		},
		{
			'<Leader>fe', function()
				require('telescope.builtin').filetypes({})
			end
		},
		{
			'<Leader>fd', function()
				require('telescope.builtin').diagnostics({ bufnr = nil })
			end
		}
	}
}
