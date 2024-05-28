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
	if client.name == 'tsserver' then
		return
	end

	vim.api.nvim_create_autocmd('BufWritePre', {
		buffer = bufnr,
		desc = 'Auto format file with ' .. client.name,
		callback = function()
			vim.lsp.buf.format()
		end
	})
end

--- @param client vim.lsp.Client
--- @param bufnr integer
function M.keymaps(client, bufnr)
	local server_capabilities = client.server_capabilities
	if not server_capabilities then
		return
	end

	if server_capabilities.definitionProvider then
		vim.keymap.set('n', 'gd', function()
			require('trouble').open('lsp_definitions')
		end)
	end

	if server_capabilities.implementationProvider then
		vim.keymap.set('n', 'gD', function()
			require('trouble').open('lsp_implementations')
		end)
	end

	if server_capabilities.referencesProvider then
		vim.keymap.set('n', 'gr', function()
			require('trouble').open('lsp_references')
		end)
	end

	if server_capabilities.hoverProvider then
		vim.keymap.set('n', 'K', function()
			vim.lsp.buf.hover()
		end)
	end

	if server_capabilities.renameProvider then
		vim.keymap.set('n', '<leader>rr', function()
			vim.lsp.buf.rename()
		end)
	end

	if server_capabilities.diagnosticProvider then
		vim.keymap.set('n', '<leader>ld', function()
			vim.diagnostic.open_float()
		end)
	end

	if server_capabilities.codeActionProvider then
		vim.keymap.set('n', '<leader>la', function()
			vim.lsp.buf.code_action()
		end)
	end

	if server_capabilities.callHierarchyProvider then
		vim.keymap.set('n', '<leader>lc', function()
			vim.lsp.buf.incoming_calls()
		end)

		vim.keymap.set('n', '<leader>lC', function()
			vim.lsp.buf.outgoing_calls()
		end)
	end
end

return M
