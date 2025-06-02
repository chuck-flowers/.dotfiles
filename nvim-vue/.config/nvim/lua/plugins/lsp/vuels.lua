vim.lsp.enable('vuels')
vim.lsp.config({
	on_attach = require("plugins.lsp.utils").on_attach,
})
