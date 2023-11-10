return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		{ 'folke/trouble.nvim' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-project.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
	},
	config = function()
		local telescope = require 'telescope'
		local actions = require 'telescope.actions'
		local trouble = require 'trouble.providers.telescope'

		telescope.load_extension('project')
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					'node_modules',
					'%.git/'
				},
				mappings = {
					i = { ['<C-t>'] = trouble.smart_open_with_trouble },
					n = { ['<C-t>'] = trouble.smart_open_with_trouble },
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
