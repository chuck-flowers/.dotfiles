return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {

	},
	keys = {
		{ '<leader>vv', function() require('trouble').toggle() end },
		{ '<leader>vd', ':Trouble diagnostics<CR>' },
		{ '<leader>vq', ':Trouble qflist<CR>' },
		{ '<leader>vt', ':Trouble telescope<CR>' },
		{ '<C-h>', function()
			require('trouble').prev()
			require('trouble').jump()
		end },
		{ '<C-l>', function()
			require('trouble').next()
			require('trouble').jump()
		end },
	}
}
