vim.lsp.enable('html')
vim.lsp.config('html', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
})
