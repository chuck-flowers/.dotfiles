vim.opt.autocomplete = true
vim.opt.complete = { '.^3', 'w^3', 'b^3', 'u^3' }
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

local group_id = vim.api.nvim_create_augroup('completion.settings', {
	clear = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = group_id,
	callback = function (ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if not client then
			return
		end

		vim.lsp.completion.enable(true, client.id, ev.buf, {
			autotrigger = true,
		})
	end
})
