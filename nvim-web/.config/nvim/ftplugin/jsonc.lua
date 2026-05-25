-- Configure LSP
local LSP = 'jsonls'
if not vim.lsp.is_enabled(LSP) then
	vim.lsp.enable(LSP)
end

