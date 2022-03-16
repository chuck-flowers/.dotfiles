local telescope = require('telescope')

vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope git_branches<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })

telescope.setup({
	defaults = {
		file_ignore_patterns = { 'node_modules' }
	}
})

