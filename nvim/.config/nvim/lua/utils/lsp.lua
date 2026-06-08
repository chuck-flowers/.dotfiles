local M = {}

--- @param lsp string
--- @param config? table
function M.enable_lsp(lsp, config)
	if config then
		vim.lsp.config(lsp, config)
	end

	vim.lsp.enable(lsp)
end

---Enables autoformatting for the buffer
---@param priority string[] The priority list for what lsp to use
function M.enable_autoformat(priority)
	vim.api.nvim_create_autocmd('BufWritePre', {
		buf = 0,
		callback = function(args)
			local clients = vim.lsp.get_clients({
				bufnr = args.buf,
			})

			for _, lsp_name in ipairs(priority) do
				--- @type vim.lsp.Client | nil
				local lsp = nil

				-- Find the specified LSP if available
				for _, client in ipairs(clients) do
					if client.name == lsp_name then
						lsp = client
						break
					end
				end

				-- If an LSP was found, perform the formatting with it
				if lsp then
					vim.notify('Running format for ' .. lsp.name, vim.log.levels.INFO)
					vim.lsp.buf.format({ async = false, id = lsp.id })
					return
				end
			end

			for _, client in ipairs(clients) do
				if not vim.tbl_contains(formatting_blacklist, client.name) then
					if client:supports_method('textDocument/formatting', args.buf) then
						vim.lsp.buf.format({ async = false, id = client.id })
					end
				end
			end
		end
	})
end

return M
