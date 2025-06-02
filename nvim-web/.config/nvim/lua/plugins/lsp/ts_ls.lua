vim.lsp.enable('ts_ls')
vim.lsp.config('ts_ls', {
	on_attach = require("plugins.lsp.utils").on_attach,
})
