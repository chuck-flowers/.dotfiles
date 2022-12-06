return {
	'nvim-telescope/telescope.nvim',
	requires = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'nvim-tree/nvim-web-devicons' },
		{ 'nvim-telescope/telescope-project.nvim' }
	},
	config = function()
		local telescope = nil
		local builtin = nil
		local function load_plugin()
			if telescope == nil then
				telescope = require 'telescope'
				builtin = require 'telescope.builtin'
				telescope.load_extension('project')
				telescope.setup({
					defaults = {
						file_ignore_patterns = {
							'node_modules',
							'.git'
						}
					}
				})
			end
		end

		vim.keymap.set('n', '<Leader>ff', function ()
			load_plugin()
			builtin.find_files({ hidden = true })
		end)

		vim.keymap.set('n', '<Leader>fb', function()
			load_plugin()
			builtin.buffers({})
		end)

		vim.keymap.set('n', '<Leader>ft', function()
			load_plugin()
			builtin.live_grep({})
		end)
		vim.keymap.set('n', '<Leader>fh', function()
			load_plugin()
			builtin.help_tags({})
		end)
		vim.keymap.set('n', '<Leader>fp', function()
			load_plugin()
			telescope.extensions.project.project({})
		end)
		vim.keymap.set('n', '<Leader>fs', function()
			load_plugin()
			builtin.lsp_dynamic_workspace_symbols({})
		end)
		vim.keymap.set('n', '<Leader>fm', function()
			load_plugin()
			builtin.man_pages({})
		end)
		vim.keymap.set('n', '<Leader>fe', function ()
			load_plugin()
			builtin.filetypes({})
		end)
		vim.keymap.set('n', '<Leader>fd', function ()
			load_plugin()
			builtin.diagnostics({ bufnr = nil })
		end)
	end
}

