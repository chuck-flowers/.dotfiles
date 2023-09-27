return {
	'folke/trouble.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	opts = {

	},
	keys = {
		{ '<leader>vv', function() require('trouble').toggle() end },
		{ '<leader>vd', function() require('trouble').open('workspace_diagnostics') end },
		{ '<leader>vq', function() require('trouble').open('quickfix') end },
		{ '<leader>vt', function() require('trouble').open('telescope') end },
		{ '<C-h>',      function() require('trouble').previous({ skip_groups = true, jump = true }) end },
		{ '<C-l>',      function() require('trouble').next({ skip_groups = true, jump = true }) end },
	}
}
