vim.lsp.enable('jsonls')
vim.lsp.config('jsonls', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
})
