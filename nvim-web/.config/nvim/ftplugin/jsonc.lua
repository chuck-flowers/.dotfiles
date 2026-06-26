-- Configure LSP
for _, lsp in ipairs({ 'jsonls', 'oxfmt' }) do
	if not vim.lsp.is_enabled(lsp) then
		vim.lsp.enable(lsp)
	end
end

vim.keymap.set('n', '<leader>rf', ":%!jq -r '.'<left>", { buf = 0 })
