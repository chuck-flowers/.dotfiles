vim.pack.add {
  "https://github.com/lewis6991/async.nvim",
  "https://github.com/theprimeagen/refactoring.nvim"
}

vim.keymap.set("v", "<leader>rv", "<cmd>Refactor extract_var<cr>")
vim.keymap.set({ "n", "x" }, "<leader>ri", "<cmd>Refactor inline_var<cr>")
