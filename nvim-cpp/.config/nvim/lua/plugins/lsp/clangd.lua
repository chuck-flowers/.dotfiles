vim.lsp.enable('clangd')
vim.lsp.config({
	on_attach = require("plugins.lsp.utils").on_attach,
})
