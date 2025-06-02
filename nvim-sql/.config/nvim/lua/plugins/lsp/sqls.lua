vim.lsp.enable('sqls')
vim.lsp.config('sqls', {
	capabilities = require("plugins.lsp.utils").client_capabilities,
	on_attach = function(client, bufnr)
		require("plugins.lsp.utils").on_attach(client, bufnr)
		require("sqls").on_attach(client, bufnr)

		vim.keymap.set("n", "<leader>ee", ":SqlsExecuteQuery<cr>")
	end,
})
