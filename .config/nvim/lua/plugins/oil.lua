return {
	'stevearc/oil.nvim',
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		view_options = {
			show_hidden = true
		}
	},
	keys = {
		{ '<leader>xx', '<cmd>Oil<CR>' },
		{ '<leader>xs', '<C-W>s<cmd>Oil<CR>' },
		{ '<leader>xv', '<C-W>v<cmd>Oil<CR>' },
	}
}
