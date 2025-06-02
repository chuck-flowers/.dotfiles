return {
	'David-Kunz/gen.nvim',
	opts = {
		model = "gemma3:latest",
	},
	keys = {
		{ '<leader>aa', '<cmd>Gen<cr>' },
		{ '<leader>ac', '<cmd>Gen Chat<cr>' },
	},
}
