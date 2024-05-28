require('lspconfig').tsserver.setup({
	on_attach = require('plugins.lsp.utils').on_attach
})
