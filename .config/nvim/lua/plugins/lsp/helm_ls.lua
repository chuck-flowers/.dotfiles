require('lspconfig').helm_ls.setup({
	capabilities = require('plugins.lsp.utils').client_capabilities,
	on_attach = require('plugins.lsp.utils').on_attach,
	settings = {
		['helm-ls'] = {
			yamlls = {
				path = 'yaml-language-server'
			}
		}
	}
})
