vim.lsp.enable('elixirls')
vim.lsp.config('elixirls', {
	cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" },
	on_attach = require("plugins.lsp.utils").on_attach,
})
