-- Treesitter
require('nvim-treesitter').install({ 'html' }):wait(10 * 1000)
vim.treesitter.start()

-- LSP
for _, lsp in ipairs({ 'emmet_language_server', 'html' }) do
	if not vim.lsp.is_enabled(lsp) then
		require('utils.lsp').enable_lsp(lsp)
	end
end
