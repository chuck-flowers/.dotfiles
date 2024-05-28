require('lspconfig').helm_ls.setup({
	capabilities = require('plugins.lsp.utils').client_capabilities,
	on_attach = function(_, bufnr)
		common_keybindings()
		register_autoformat(bufnr, 'Helm')
	end,
	settings = {
		['helm-ls'] = {
			yamlls = {
				path = 'yaml-language-server'
			}
		}
	}
})
