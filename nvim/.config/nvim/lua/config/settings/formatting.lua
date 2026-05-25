local group = vim.api.nvim_create_augroup('autoformatting', {
	clear = true,
})

-- Enable support for .editorconfig files
require('editorconfig')

-- Autoformatting
local formatting_blacklist = { 'ts_ls' }
vim.api.nvim_create_autocmd('BufWritePre', {
	group = group,
	callback = function(args)
		local clients = vim.lsp.get_clients({
			bufnr = args.buf,
		})

		for _, client in ipairs(clients) do
			if not vim.tbl_contains(formatting_blacklist, client.name) then
				if client:supports_method('textDocument/formatting', args.buf) then
					vim.lsp.buf.format({ async = false, id = client.id })
				end
			end
		end
	end
})
