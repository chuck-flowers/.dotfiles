vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer', {
	capabilities = require('plugins.lsp.utils').client_capabilities,
	on_attach = require("plugins.lsp.utils").on_attach,
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true;
			}
		}
	}
})
