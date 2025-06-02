vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
})
