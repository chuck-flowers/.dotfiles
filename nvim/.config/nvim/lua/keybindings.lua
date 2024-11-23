vim.g.mapleader = " "

-- Move lines of text
vim.keymap.set("n", "<C-j>", ":m+1<CR>==", { noremap = true })
vim.keymap.set("n", "<C-k>", ":m-2<CR>==", { noremap = true })
vim.keymap.set("v", "<C-j>", ":'<'>m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-k>", ":'<'>m '<-2<CR>gv=gv", { noremap = true })

-- Tweaks the scrolling behavior
vim.keymap.set("n", "<C-f>", "<C-f>M", { noremap = true })
vim.keymap.set("n", "<C-b>", "<C-b>M", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>M", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>M", { noremap = true })
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Keybindings for terminal
vim.keymap.set("n", "<leader>tt", "<cmd>terminal<CR>")
vim.keymap.set("n", "<leader>ts", "<C-W>s<cmd>terminal<CR>")
vim.keymap.set("n", "<leader>tv", "<C-W>v<cmd>terminal<CR>")

-- Keybindings for expression register
vim.keymap.set("v", "<C-r>=", 'c<C-R>=<C-R>"<CR><ESC>')

-- Allows for reloading config
vim.keymap.set("n", "<leader><leader>so", function()
	package.loaded = {}
	vim.cmd("source ~/.config/nvim/init.lua")
end)

-- Adds keybinding for lazy.nvim
vim.keymap.set("n", "<leader>p", "<cmd>Lazy<CR>")
