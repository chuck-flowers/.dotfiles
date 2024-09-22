require('lspconfig').eslint.setup({
	on_attach = function(client, bufnr)
		require('plugins.lsp.utils').on_attach(client, bufnr)

		vim.api.nvim_create_autocmd('BufWritePre', {
			buffer = bufnr,
			desc = 'Auto format file with ' .. client.name,
			command = ':EslintFixAll'
		})
	end,
	settings = {
		format = true
	}
})
