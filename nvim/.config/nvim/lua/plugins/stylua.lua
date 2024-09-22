return {
	'ckipp01/stylua-nvim',
	ft = { 'lua' },
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local stylua = require 'stylua-nvim'

		local autocmd_group = vim.api.nvim_create_augroup('Stylua', {
			clear = true
		})

		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			group = autocmd_group,
			pattern = { '*.lua' },
			callback = function ()
				print('Auto Command invoked')
				stylua.format_file()
			end
		})

		stylua.setup({})
	end,
}
