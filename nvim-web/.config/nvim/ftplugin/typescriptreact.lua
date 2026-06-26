-- Treesitter
require('nvim-treesitter').install({ 'tsx' }):wait(10 * 1000)
vim.treesitter.start()

-- Configure LSP
for _, lsp in ipairs({ 'emmet_language_server', 'ts_ls', 'eslint', 'oxlint', 'oxfmt' }) do
	if not vim.lsp.is_enabled(lsp) then
		require('utils.lsp').enable_lsp(lsp)
	end
end
