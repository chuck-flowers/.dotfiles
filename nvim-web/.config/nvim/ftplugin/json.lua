-- Enable treesitter highlighting
vim.treesitter.start()

-- Keybinding for JQ filtering
vim.keymap.set("n", "<leader>rf", ":%!jq -r ''<left>", { buffer = 0 })
