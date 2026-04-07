vim.opt.autocomplete = true
vim.opt.complete = { '.^3', 'w^3', 'b^3', 'u^3' }
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }

local group_id = vim.api.nvim_create_augroup('completion.settings', {
	clear = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = group_id,
	callback = function (args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			vim.notify('Failed to determine client for attached LSP', vim.log.levels.ERROR)
			return
		end

		-- Allow Ctrl+Space to trigger completion
		vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end, {
			buf = args.buf,
		})

		vim.lsp.completion.enable(true, client.id, args.buf, {
			autotrigger = true,
		})
	end
})
