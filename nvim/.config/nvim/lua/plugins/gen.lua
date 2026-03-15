return {
	'David-Kunz/gen.nvim',
	opts = {
		model = "qwen3.5:latest",
		display_mode = 'vertical-split',
		show_model = true,
	},
	cmd = { 'Gen' },
	keys = {
		{ '<leader>aa', '<cmd>Gen<cr>' },
		{ '<leader>ac', '<cmd>Gen Chat<cr>' },
		{ '<leader>ar', '<cmd>Gen Review_Code<cr>' },
		{ '<leader>am', function() require('gen').select_model() end },
	},
}
