vim.pack.add({
	"https://www.github.com/nvim-lua/plenary.nvim",
	{ src = "https://www.github.com/olimorris/codecompanion.nvim", version = vim.version.range("^19.0.0") },
})

require('codecompanion').setup({
	adapters = {
		http = {
			ollama = function ()
				return require('codecompanion.adapters').extend('ollama', {
					-- TODO: Settings
				})
			end
		}
	},
	interactions = {
		chat = {
			adapter = {
				name = 'ollama',
				model = 'qwen3.5',
			},
		},
	},
})

vim.keymap.set('n', '<leader>aa', function() require('codecompanion').toggle() end)
