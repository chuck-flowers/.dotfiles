vim.lsp.enable('dockerls')
vim.lsp.config('dockerls', {
	on_attach = require("plugins.lsp.utils").on_attach,
})
