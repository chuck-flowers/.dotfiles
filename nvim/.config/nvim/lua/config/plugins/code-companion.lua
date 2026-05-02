vim.pack.add({
	"https://www.github.com/nvim-lua/plenary.nvim",
	{ src = "https://www.github.com/olimorris/codecompanion.nvim", version = vim.version.range("^19.0.0") },
})

require('codecompanion').setup({
	adapters = {
		http = {
			ollama = function ()
				return require('codecompanion.adapters').extend('ollama')
			end,
			openrouter = function()
				return require('codecompanion.adapters').extend('openai_compatible', {
					env = {
						url = 'https://openrouter.ai/api',
						api_key = 'OPENROUTER_API_KEY',
						chat_url = '/v1/chat/completions',
					},
					schema = {
						model = {
							default = 'openai/gpt-oss-120b:free'
						},
					},
				})
			end
		}
	},
	interactions = {
		chat = {
			-- adapter = { name = 'ollama', model = 'qwen3.5' },
			adapter = 'openrouter',
			-- adapter = { name = 'openrouter', model = 'openrouter/auto' },
			keymaps = {
				completion = {
					modes = { i = '<C-Space>' },
				},
			},
		},
		inline = {
			-- adapter = { name = 'ollama', model = 'qwen3.5' },
			adapter = 'openrouter',
			-- adapter = { name = 'openrouter', model = 'openrouter/auto' },
		},
	},
	opts = {
		log_level = 'DEBUG',
	},
})

-- vim.keymap.set('n', '<leader>aa', function() require('codecompanion').actions() end)
vim.keymap.set('n', '<leader>ac', function() require('codecompanion').toggle() end)
vim.keymap.set({ 'n', 'v' }, '<leader>ai', ':CodeCompanion<cr>')
