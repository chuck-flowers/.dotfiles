-- Toggle the quickfix list
vim.keymap.set('n', '<leader>vv', function()
	local is_open = false

	local win_ids = vim.api.nvim_list_wins()
	for _, win_id in ipairs(win_ids) do
		local buf_id = vim.api.nvim_win_get_buf(win_id)
		local ft = vim.fn.getbufvar(buf_id, '&filetype')
		if ft == 'qf' then
			is_open = true
			break
		end
	end

	if is_open then
		vim.cmd('cclose')
	else
		vim.cmd('copen')
	end
end)

vim.keymap.set('n', '<leader>vd', function()
	vim.diagnostic.setqflist({ open = true })
end)
