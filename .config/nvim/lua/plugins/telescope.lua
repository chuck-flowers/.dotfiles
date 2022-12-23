return {
	'nvim-telescope/telescope.nvim',
	requires = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'nvim-telescope/telescope-project.nvim' }
	},
	module = 'telescope',
	keys = {
		{ 'n', '<leader>f' },
	},
	config = function()
		print('Configuring telescope')

		local telescope = require 'telescope'
		local builtin = require 'telescope.builtin'

		telescope.load_extension('project')
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					'node_modules',
					'.git'
				}
			}
		})
		
		vim.keymap.set('n', '<Leader>ff', function ()
			builtin.find_files({ hidden = true })
		end)
		vim.keymap.set('n', '<Leader>fb', function()
			builtin.buffers({})
		end)
		vim.keymap.set('n', '<Leader>ft', function()
			builtin.live_grep({})
		end)
		vim.keymap.set('n', '<Leader>fh', function()
			builtin.help_tags({})
		end)
		vim.keymap.set('n', '<Leader>fp', function()
			telescope.extensions.project.project({})
		end)
		vim.keymap.set('n', '<Leader>fs', function()
			builtin.lsp_dynamic_workspace_symbols({})
		end)
		vim.keymap.set('n', '<Leader>fm', function()
			builtin.man_pages({})
		end)
		vim.keymap.set('n', '<Leader>fe', function ()
			builtin.filetypes({})
		end)
		vim.keymap.set('n', '<Leader>fd', function ()
			builtin.diagnostics({ bufnr = nil })
		end)
	end
}

