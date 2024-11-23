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
		local refactoring = require("refactoring")

		refactoring.setup({})

		local extract_function = function()
			refactoring.refactor("Extract Function")
		end

		local extract_variable = function()
			refactoring.refactor("Extract Variable")
		end

		local inline_variable = function()
			refactoring.refactor("Inline Variable")
		end

		vim.keymap.set("v", "<leader>re", extract_function)
		vim.keymap.set("v", "<leader>rv", extract_variable)
		vim.keymap.set("v", "<leader>ri", inline_variable)
		vim.keymap.set("n", "<leader>ri", inline_variable)
	end,
}
