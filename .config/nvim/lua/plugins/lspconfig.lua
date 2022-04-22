return {
	'neovim/nvim-lspconfig',
	config = function()
		local lspconfig = require('lspconfig')

		local lsps = {
			'bashls',
			'clangd',
			'dockerls',
			'graphql',
			'pylsp',
			'rust_analyzer',
			'tsserver',
			'yamlls'
		}

		for _, lsp in ipairs(lsps) do
			local settings = {
				on_attach = function (client, bufnr)
					local opts = { noremap=true, silent=true }

					local function buf_set_keymap(...)
						vim.api.nvim_buf_set_keymap(bufnr, ...)
					end

					buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
					buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
					buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts);
					buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
					buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
				end
			}

			if lsp == 'yamlls' then
				-- TODO
				settings.settings = {
					yaml = {
						schemas = {
							['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose*.yml'
						}
					}
				}
			end

			lspconfig[lsp].setup(settings)
		end
	end
}

