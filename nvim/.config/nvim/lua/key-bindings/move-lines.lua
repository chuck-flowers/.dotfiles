vim.keymap.set("n", "<C-j>", ":m+1<CR>==", { noremap = true })
vim.keymap.set("n", "<C-k>", ":m-2<CR>==", { noremap = true })
vim.keymap.set("v", "<C-j>", ":'<'>m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-k>", ":'<'>m '<-2<CR>gv=gv", { noremap = true })
