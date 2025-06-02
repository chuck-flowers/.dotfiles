vim.lsp.enable('svelte')
vim.lsp.config('svelte', {
	on_attach = require("plugins.lsp.utils").on_attach,
})
