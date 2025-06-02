vim.lsp.enable('emmet_language_server')
vim.lsp.config('emmet_language_server', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
})
