vim.pack.add({ "https://github.com/brianhuster/unnest.nvim" })

-- Enable full color support
vim.o.termguicolors = true

-- Open Terminal Buffers
vim.keymap.set("n", "<leader>tt", "<cmd>terminal<CR>")
vim.keymap.set("n", "<leader>ts", "<C-W>s<cmd>terminal<CR>")
vim.keymap.set("n", "<leader>tv", "<C-W>v<cmd>terminal<CR>")

-- Swap to Terminal Buffers
vim.keymap.set("n", "<leader>tn", function()
	local curr_buf = vim.api.nvim_get_current_buf()

	--- @type integer | nil
	local matching_buf = nil
	for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
		local buf = vim.api.nvim_buf_get_name(buf_id)

		local is_term_buf = buf:sub(0, 5) == "term:"
		if is_term_buf then
			if matching_buf == nil then
				matching_buf = buf_id
			elseif buf_id > curr_buf then
				matching_buf = buf_id
			end
		end
	end

	if matching_buf then
		vim.api.nvim_set_current_buf(matching_buf)
	else
		vim.notify('No terminal buffer found', vim.log.levels.WARN)
	end
end)
