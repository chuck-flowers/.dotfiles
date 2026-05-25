-- Treesitter
require('nvim-treesitter').install({ 'javascript' }):wait(10 * 1000)
vim.treesitter.start()

-- Configure LSP
local lsps = { 'ts_ls', 'eslint', 'oxlint', 'oxfmt' }
for _, lsp in ipairs(lsps) do
	if not vim.lsp.is_enabled(lsp) then
		require('utils.lsp').enable_lsp(lsp)
	end
end
