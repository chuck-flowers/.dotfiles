-- Treesitter
require('nvim-treesitter').install({ 'yaml' }):wait(10 * 1000)
vim.treesitter.start()

vim.opt_local.list = true
vim.opt_local.cursorcolumn = true

-- YAML LSP
if not vim.lsp.is_enabled(('yamlls')) then
	require('utils.lsp').enable_lsp(('yamlls'), {
		settings = {
			yaml = {
				schemas = {
					kubernetes = "*.k8s.yaml",
				},
			},
		}
	})
end
