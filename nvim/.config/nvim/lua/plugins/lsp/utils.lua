local M = {}

M.client_capabilities = vim.lsp.protocol.make_client_capabilities()
M.client_capabilities.textDocument.completion.completionItem.snippetSupport = true

--- @param client vim.lsp.Client
--- @param bufnr integer
function M.on_attach(client, bufnr)
	M.autoformat(client, bufnr)
	M.keymaps(client, bufnr)
end

--- @param client vim.lsp.Client
--- @param bufnr integer
function M.autoformat(client, bufnr)
	if client.name == "ts_ls" or client.name == "sqls" then
		return
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			desc = "Auto format file with " .. client.name,
			callback = function()
				vim.lsp.buf.format({
					id = client.id,
				})
			end,
		})
	end
end

--- @param client vim.lsp.Client
--- @param bufnr integer
function M.keymaps(client, bufnr)
	local server_capabilities = client.server_capabilities
	if not server_capabilities then
		return
	end

	if server_capabilities.callHierarchyProvider then
		vim.keymap.set("n", "grc", function()
			vim.lsp.buf.incoming_calls()
		end)

		vim.keymap.set("n", "grC", function()
			vim.lsp.buf.outgoing_calls()
		end, {
			buffer = bufnr,
		})
	end
end

return M
