return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	ft = {
		"c",
		"cpp",
		"go",
		"java",
		"javascript",
		"javascriptreact",
		"lua",
		"php",
		"python",
		"ruby",
		"typescript",
		"typescriptreact",
	},
	config = function()
		require("refactoring").setup({})

		vim.keymap.set("v", "<leader>rv", "<cmd>Refactor extract_var<cr>")
		vim.keymap.set({ "n", "x" }, "<leader>ri", "<cmd>Refactor inline_var<cr>")
	end,
}
