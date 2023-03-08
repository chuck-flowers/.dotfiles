return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'nvim-telescope/telescope-project.nvim' }
	},
	config = function()
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
		{ '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>' },
		{ '<leader>fb', '<cmd>Telescope buffers<cr>' },
		{ '<leader>ft', '<cmd>Telescope live_grep<cr>' },
		{ '<leader>fh', '<cmd>Telescope help_tags<cr>' },
		{ '<leader>fp', '<cmd>Telescope project <cr>' },
		{ '<leader>fs', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>' },
		{ '<leader>fm', '<cmd>Telescope man_pages<cr>' },
		{ '<leader>fe', '<cmd>Telescope filetypes<cr>' },
		{ '<leader>fd', '<cmd>Telescope diagnostics<cr>' },
		{ '<leader>fk', '<cmd>Telescope keymaps<cr>' }
	}
}
