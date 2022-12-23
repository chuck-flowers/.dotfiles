return {
	'nanotee/sqls.nvim',
	module = 'sqls',
	config = function()
		vim.keymap.set('n', '<leader>r', '<Plug>(sqls-execute-query)')
	end
}
