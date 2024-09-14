require('lspconfig').ts_ls.setup({
	on_attach = require('plugins.lsp.utils').on_attach
})
