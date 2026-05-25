-- Treesitter
require('nvim-treesitter').install({ 'tsx' }):wait(10 * 1000)
vim.treesitter.start()

-- Configure LSP
for _, lsp in ipairs({ 'ts_ls', 'eslint', 'oxlint' }) do
	if not vim.lsp.is_enabled(lsp) then
		require('utils.lsp').enable_lsp(lsp)
	end
end
