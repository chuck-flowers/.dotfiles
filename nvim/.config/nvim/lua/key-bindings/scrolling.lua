vim.keymap.set("n", "<C-f>", "<C-f>M")
vim.keymap.set("n", "<C-b>", "<C-b>M")
vim.keymap.set("n", "<C-d>", "<C-d>M")
vim.keymap.set("n", "<C-u>", "<C-u>M")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
	vim.cmd('norm zz')
end)

vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
	vim.cmd('norm zz')
end)
