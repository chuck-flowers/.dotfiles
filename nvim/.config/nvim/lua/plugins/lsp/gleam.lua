require('lspconfig').gleam.setup({
	capabilities = require('plugins.lsp.utils').client_capabilities,
	on_attach = function(client, bufnr)
		require('plugins.lsp.utils').on_attach(client, bufnr)
	end
})
