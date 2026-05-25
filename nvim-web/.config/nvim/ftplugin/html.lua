-- Config LSPs
for _, lsp in ipairs({ 'emmet_language_server', 'html' }) do
	if not vim.lsp.is_enabled(lsp) then
		require('utils.lsp').enable_lsp(lsp)
	end
end
