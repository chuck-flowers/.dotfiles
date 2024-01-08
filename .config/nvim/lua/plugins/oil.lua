return {
	'stevearc/oil.nvim',
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	opts = {
		columns = {
			"icon",
			"permissions",
		},
		keymaps = {
			["T"] = "actions.open_terminal"
		},
		view_options = {
			show_hidden = true,
		}
	},
	keys = {
		{ '<leader>xx', '<cmd>Oil<CR>' },
		{ '<leader>xX', '<cmd>Oil .<CR>' },
		{ '<leader>xs', '<C-W>s<cmd>Oil<CR>' },
		{ '<leader>xS', '<C-W>s<cmd>Oil .<CR>' },
		{ '<leader>xv', '<C-W>v<cmd>Oil<CR>' },
		{ '<leader>xV', '<C-W>v<cmd>Oil .CR>' },
	}
}
