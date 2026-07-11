-- Treesitter
require('nvim-treesitter').install({ 'bash' }):wait(10 * 1000)
vim.treesitter.start()

-- Configure LSP
local LSP = 'bashls'
if not vim.lsp.is_enabled(LSP) then
	require('utils.lsp').enable_lsp(LSP)
end
