-- Auto wrap text at 80 characters
vim.bo.textwidth = 80

-- Treesitter
require('nvim-treesitter').install({ 'markdown' }):wait(10 * 1000)
vim.treesitter.start()

-- Configure LSP
local LSP = 'marksman'
if not vim.lsp.is_enabled(LSP) then
	require('utils.lsp').enable_lsp(LSP)
end
