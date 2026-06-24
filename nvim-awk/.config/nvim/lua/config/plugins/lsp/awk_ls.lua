vim.lsp.enable('awk_ls')
vim.lsp.config('awk_ls', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
})
