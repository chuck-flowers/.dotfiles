vim.pack.add({
	'https://github.com/folke/lazydev.nvim',
})

-- Configure LSP
local LSP = 'lua_ls'
if not vim.lsp.is_enabled(LSP) then
	require('lazydev').setup({

	})

	vim.lsp.enable(LSP)
end

