return {
	'nvim-telescope/telescope.nvim',
	requires = {
		{ 'nvim-lua/plenary.nvim' },
		{ 'kyazdani42/nvim-web-devicons' },
		{ 'nvim-telescope/telescope-project.nvim' }
	},
	config = function()
		local telescope = require('telescope')
		local builtins = require('telescope.builtin')

		telescope.load_extension('project')

		vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require("telescope.builtin").find_files({ hidden = true })<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope git_branches<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>ft', ':Telescope live_grep<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>fp', ':Telescope project<CR>', { noremap = true })

		telescope.setup({
			defaults = {
				file_ignore_patterns = { 'node_modules' }
			}
		})
	end
}

