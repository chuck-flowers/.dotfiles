local group = vim.api.nvim_create_augroup('autoformatting', {
	clear = true,
})

-- Enable support for .editorconfig files
require('editorconfig')

--- @type { [string]: string[] }
local priority_mapping = {
	css = { 'stylelint_lsp', 'cssls' },
	typescript = { 'oxfmt', 'eslint', 'ts_ls' }
}

--- @param client vim.lsp.Client
local function format_with(client)
	if client:supports_method('textDocument/formatting') then
		vim.notify('Running format for ' .. client.name, vim.log.levels.INFO)
		return vim.lsp.buf.format({ async = false, id = client.id })
	end
end

-- Autoformatting
vim.api.nvim_create_autocmd('BufWritePre', {
	group = group,
	callback = function(args)
		local clients = vim.lsp.get_clients({
			bufnr = args.buf,
		})

		-- Apply configured formatter if present
		local priority = priority_mapping[vim.o.ft]
		if priority ~= nil then
			for _, lsp_name in ipairs(priority) do
				for _, client in ipairs(clients) do
					if client.name == lsp_name then
						format_with(client)
						return
					end
				end
			end
		end

		-- Run formatting with all LSPs
		for _, client in ipairs(clients) do
			if client:supports_method('textDocument/formatting', args.buf) then
				format_with(client)
			end
		end
	end
})
