return {
	'TimUntersberger/neogit',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		vim.api.nvim_set_keymap('n', '<Leader>gs', '<cmd>lua require("neogit").open()<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>gc', '<cmd>lua require("neogit").open({ "commit" })<CR>', { noremap = true })
		-- vim.api.nvim_set_keymap('n', '<Leader>gC', ':Git commit -a<CR>', { noremap = true })
		vim.api.nvim_set_keymap('n', '<Leader>gl', '<cmd>lua require("neogit").open({ "log" })<CR>', { noremap = true })
		-- vim.api.nvim_set_keymap('n', '<Leader>gbm', ':Git checkout --track master -b ', { noremap = true })
		-- vim.api.nvim_set_keymap('n', '<Leader>gir', ':Git rebase -i<CR>', { noremap = true })
		-- vim.api.nvim_set_keymap('n', '<Leader>gr', ':Git rebase<CR>', { noremap = true })
		-- vim.api.nvim_set_keymap('n', '<Leader>gm', ':Git merge ', { noremap = true })
		-- vim.api.nvim_set_keymap('n', '<Leader>gp', ':Git push<CR>', { noremap = true })
		-- vim.api.nvim_set_keymap('n', '<Leader>gP', ':Git pull<CR>', { noremap = true })
	end
}

