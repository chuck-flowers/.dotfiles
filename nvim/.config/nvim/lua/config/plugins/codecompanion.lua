vim.pack.add({
	"https://www.github.com/nvim-lua/plenary.nvim",
	{ src = "https://www.github.com/olimorris/codecompanion.nvim",         version = vim.version.range("^19.0.0") },
	{ src = "https://github.com/franco-ruggeri/codecompanion-spinner.nvim" },
})

require('codecompanion').setup({
	adapters = require('config.plugins.codecompanion.adapters'),
	interactions = {
		chat = {
			adapter = 'openrouter',
			keymaps = {
				completion = {
					modes = { i = '<C-Space>' },
				},
			},
		},
		inline = {
			adapter = 'openrouter',
		},
	},
	prompt_library = {
		markdown = {
			dirs = {
				vim.fn.stdpath('config') .. '/lua/config/plugins/codecompanion/prompts'
			}
		}
	},
	extensions = {
		spinner = {}
	},
})

vim.keymap.set({ 'n', 'v' }, '<leader>aa', function() require('codecompanion').actions({}) end)
vim.keymap.set({ 'n' }, '<leader>ac', function() require('codecompanion').toggle() end)

vim.keymap.set({ 'v' }, '<leader>ac', function()
	local chat = require('codecompanion.interactions.chat')
	if chat.is_visible() then
		require('codecompanion').add({})
	else
		require('codecompanion').chat()
	end
end)

vim.keymap.set({ 'n', 'v' }, '<leader>ai', ':CodeCompanion<cr>')
vim.keymap.set({ 'n', 'v' }, '<leader>ar', function() require('codecompanion').prompt('review') end)
