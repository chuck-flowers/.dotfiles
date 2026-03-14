return {
	'David-Kunz/gen.nvim',
	opts = {
		model = "gemma3:latest",
		display_mode = 'vertical-split',
		show_model = true,
	},
	cmd = { 'Gen' },
	keys = {
		{ '<leader>aa', '<cmd>Gen<cr>' },
		{ '<leader>ac', '<cmd>Gen Chat<cr>' },
	},
}
