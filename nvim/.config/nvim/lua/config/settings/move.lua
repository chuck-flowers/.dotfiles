-- Move Lines
vim.keymap.set("n", "<C-j>", ":m+1<CR>==", { noremap = true })
vim.keymap.set("n", "<C-k>", ":m-2<CR>==", { noremap = true })
vim.keymap.set("v", "<C-j>", ":'<'>m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-k>", ":'<'>m '<-2<CR>gv=gv", { noremap = true })

-- Move Objects
vim.keymap.set({ 'n' }, 'snh', function ()
	require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner')
end)

vim.keymap.set({ 'n' }, 'snl', function ()
	require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
end)
