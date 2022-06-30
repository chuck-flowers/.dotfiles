return {
	'neovim/nvim-lspconfig',
	config = function()
		local lspconfig = require('lspconfig')

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local lsps = {
			bashls = {},
			clangd = {},
			dockerls = {},
			graphql = {},
			jsonls = {
				capabilities = capabilities
			},
			omnisharp = {
				cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(pid) }
			},
			pylsp = {},
			rust_analyzer = {},
			sumneko_lua = {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT'
						},
						diagnostics = {
							globals = { 'vim' }
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true)
						}
					}
				}
			},
			tsserver = {},
			yamlls = {
				settings = {
					yaml = {
						customTags = { '!GetAtt', '!Ref' },
						schemas = {
							['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose*.yml'
						}
					}
				}
			}
		}

		for lsp, settings in pairs(lsps) do
			settings.on_attach = function (client, bufnr)
				local opts = { noremap=true, silent=true }

				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end

				buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts);
				buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
				buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
			end

			lspconfig[lsp].setup(settings)
		end
	end
}

