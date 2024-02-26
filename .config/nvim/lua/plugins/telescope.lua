return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		{ 'folke/trouble.nvim' },
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-telescope/telescope-project.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
	},
	config = function()
		require('telescope').load_extension('project')
		require('telescope').setup({
			defaults = {
				file_ignore_patterns = {
					'node_modules',
					'%.git/'
				},
				mappings = {
					i = {
						['<C-q>'] = function(prompt_bufnr)
							require('telescope.actions').smart_send_to_qflist(prompt_bufnr)
							require('trouble').open('quickfix')
						end,
					},
					n = {
						['<C-q>'] = function(prompt_bufnr)
							require('telescope.actions').smart_send_to_qflist(prompt_bufnr)
							require('trouble').open('quickfix')
						end,
					},
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
