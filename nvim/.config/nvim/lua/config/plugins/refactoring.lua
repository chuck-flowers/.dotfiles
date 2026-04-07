vim.pack.add({
	"https://github.com/ThePrimeagen/refactoring.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("refactoring").setup({})

vim.keymap.set("v", "<leader>rv", "<cmd>Refactor extract_var<cr>")
vim.keymap.set({ "n", "x" }, "<leader>ri", "<cmd>Refactor inline_var<cr>")
