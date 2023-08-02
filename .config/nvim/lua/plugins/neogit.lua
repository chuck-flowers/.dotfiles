return {
	'NeogitOrg/neogit',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim'
	},
	config = function()
		require('neogit').setup()
	end,
	keys = {
		{
			'<leader>gs',
			function()
				require('neogit').open()
			end
		},
		{
			'<leader>gc',
			function()
				require("neogit").open({ "commit" })
			end
		},
		{
			'<leader>gl',
			function()
				require("neogit").open({ "log" })
			end
		}
	}
}
