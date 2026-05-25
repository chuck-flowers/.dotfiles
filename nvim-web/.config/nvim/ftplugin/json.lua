-- Configure LSP
local LSP = 'jsonls'
if not vim.lsp.is_enabled(LSP) then
	vim.lsp.enable(LSP)
end

vim.keymap.set('n', '<leader>rf', ":%!jq -r '.'<left>", { buf = 0 })
