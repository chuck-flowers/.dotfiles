return {
	'nvim-telescope/telescope.nvim',
	requires = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'kyazdani42/nvim-web-devicons' },
		{ 'nvim-telescope/telescope-project.nvim' }
	},
	config = function()
		local telescope = require('telescope')

		telescope.load_extension('project')

		vim.keymap.set('n', '<Leader>ff', ':lua require("telescope.builtin").find_files({ hidden = true })<CR>', { noremap = true })
		vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>', { noremap = true })
		vim.keymap.set('n', '<Leader>ft', ':Telescope live_grep<CR>', { noremap = true })
		vim.keymap.set('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })
		vim.keymap.set('n', '<Leader>fp', ':Telescope project<CR>', { noremap = true })
		vim.keymap.set('n', '<Leader>fs', ':Telescope lsp_dynamic_workspace_symbols<CR>', { noremap = true })

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					'node_modules',
					'.git'
				}
			}
		})
	end
}

