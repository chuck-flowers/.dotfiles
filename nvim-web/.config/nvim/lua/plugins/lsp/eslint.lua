vim.lsp.enable('eslint')
vim.lsp.config('eslint', {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			desc = "Auto format file with " .. client.name,
			callback = function()
				client:exec_cmd({
					title = 'Fix all Eslint errors for current buffer',
					command = 'eslint.applyAllFixes',
					arguments = {
						{
							uri = vim.uri_from_bufnr(bufnr),
							version = vim.lsp.util.buf_versions[bufnr],
						},
					},
				}, { bufnr = bufnr })
			end
		})
	end,
})
