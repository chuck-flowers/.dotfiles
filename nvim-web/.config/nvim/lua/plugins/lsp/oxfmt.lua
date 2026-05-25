vim.lsp.enable('oxfmt')
vim.lsp.config('oxfmt', {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			desc = "Auto format file with " .. client.name,
			callback = function()
				vim.lsp.buf.format()
			end
		})
	end,
})
