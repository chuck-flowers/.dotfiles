return {
	'williamboman/mason-lspconfig.nvim',
	requires = {
		'williamboman/mason.nvim'
	},
	config = function ()
		local mason_lspconfig = require 'mason-lspconfig'

		mason_lspconfig.setup({
			automatic_installation = true
		})
	end
}
