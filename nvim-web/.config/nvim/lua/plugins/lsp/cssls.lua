vim.lsp.enable('cssls')
vim.lsp.config('cssls', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
})
