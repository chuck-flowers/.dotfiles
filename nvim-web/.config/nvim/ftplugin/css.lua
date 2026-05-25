-- Config LSPs
for _, lsp in ipairs({ 'cssls', 'stylelint_lsp' }) do
	if not vim.lsp.is_enabled(lsp) then
		vim.lsp.enable(lsp)
	end
end
