local telescope = require('telescope')
local builtins = require('telescope.builtin')

vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require("telescope.builtin").find_files({ hidden = true })<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope git_branches<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', ':Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', ':Telescope help_tags<CR>', { noremap = true })

telescope.setup({
	defaults = {
		file_ignore_patterns = { 'node_modules' }
	}
})

