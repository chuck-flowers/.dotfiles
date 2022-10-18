return {
	'nvim-telescope/telescope.nvim',
	requires = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'nvim-telescope/telescope-project.nvim' }
	},
	config = function()
		local telescope = require('telescope')
		telescope.load_extension('project')

		vim.keymap.set('n', '<Leader>ff', function ()
			require('telescope.builtin').find_files({ hidden = true })
		end)

		vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
		vim.keymap.set('n', '<Leader>ft', '<cmd>Telescope live_grep<CR>')
		vim.keymap.set('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>')
		vim.keymap.set('n', '<Leader>fp', '<cmd>Telescope project<CR>')
		vim.keymap.set('n', '<Leader>fs', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')
		vim.keymap.set('n', '<Leader>fm', '<cmd>Telescope man_pages<CR>')

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

