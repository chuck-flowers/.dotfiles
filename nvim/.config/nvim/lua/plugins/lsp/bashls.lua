vim.lsp.enable('bashls')
vim.lsp.config('bashls', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
})
