-- Treesitter
require('nvim-treesitter').install({ 'css' }):wait(10 * 1000)
vim.treesitter.start()

-- Config LSPs
for _, lsp in ipairs({ 'cssls', 'stylelint_lsp', 'oxfmt' }) do
	if not vim.lsp.is_enabled(lsp) then
		require('utils.lsp').enable_lsp(lsp)
	end
end
