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

	if server_capabilities.definitionProvider then
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, {
			buffer = bufnr,
		})
	end

	if server_capabilities.implementationProvider then
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.implementation()
		end, {
			buffer = bufnr,
		})
	end

	if server_capabilities.referencesProvider then
		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, {
			buffer = bufnr,
		})
	end

	if server_capabilities.hoverProvider then
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, {
			buffer = bufnr,
		})
	end

	if server_capabilities.renameProvider then
		vim.keymap.set("n", "<leader>rr", function()
			vim.lsp.buf.rename()
		end, {
			buffer = bufnr,
		})
	end

	if server_capabilities.diagnosticProvider then
		vim.keymap.set("n", "<leader>ld", function()
			vim.diagnostic.open_float()
		end, {
			buffer = bufnr,
		})
	end

	if server_capabilities.codeActionProvider then
		vim.keymap.set("n", "<leader>la", function()
			vim.lsp.buf.code_action()
		end, {
			buffer = bufnr,
		})
	end

	if server_capabilities.callHierarchyProvider then
		vim.keymap.set("n", "<leader>lc", function()
			vim.lsp.buf.incoming_calls()
		end)

		vim.keymap.set("n", "<leader>lC", function()
			vim.lsp.buf.outgoing_calls()
		end, {
			buffer = bufnr,
		})
	end

	if server_capabilities.signatureHelpProvider then
		vim.keymap.set("n", "<leader>ls", function()
			vim.lsp.buf.signature_help()
		end, {
			buffer = bufnr,
		})
	end
end

return M
