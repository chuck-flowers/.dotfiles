return {
	'nanotee/sqls.nvim',
	config = function()
		vim.keymap.set('n', '<leader>r', '<Plug>(sqls-execute-query)')
	end,
	ft = { 'sql' }
}
