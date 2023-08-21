return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason-lspconfig.nvim'
	},
	config = function()
		local lspconfig = require('lspconfig')

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local lsps = {
			awk_ls = {},
			bashls = {},
			clangd = {
				on_attach = function()
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = 0,
						desc = 'Auto lint C files',
						callback = function()
							vim.lsp.buf.format()
						end
					})
				end
			},
			cssls = {
				capabilities = capabilities
			},
			dockerls = {},
			dotls = {},
			eslint = {
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = true
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = 0,
						desc = 'Auto lint with ESLint',
						callback = function()
							vim.lsp.buf.format({
								filter = function(c)
									return c.name == 'eslint'
								end
							})
						end
					})
				end
			},
			graphql = {},
			html = {
				capabilities = capabilities
			},
			jsonls = {
				capabilities = capabilities,
				on_attach = function()
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = 0,
						desc = 'Autoformat JSON files',
						callback = function()
							vim.lsp.buf.format()
						end
					})
				end
			},
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT'
						},
						diagnostics = {
							globals = { 'vim' }
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file('', true)
						}
					}
				}
			},
			marksman = {},
			omnisharp = {
				cmd = { 'omnisharp', '--languageserver', '--hostPID', tostring(pid) }
			},
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							pylint = {
								enabled = true,
								executable = 'pylint'
							}
						}
					}
				}
			},
			rust_analyzer = {},
			sqlls = {},
			svelte = {},
			tsserver = {
				init_options = {
					preferences = {
						quotePreference = 'single'
					}
				}
			},
			vuels = {},
			yamlls = {
				settings = {
					yaml = {
						customTags = {
							'!FindInMap sequence',
							'!GetAtt',
							'!Join sequence',
							'!Ref',
							'!Sub'
						},
						schemas = {
							['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose*.yml'
						}
					}
				}
			}
		}

		for lsp, settings in pairs(lsps) do
			local custom_on_attach = settings.on_attach
			settings.on_attach = function(client, bufnr)
				local telescope_builtin = nil
				local function load_telescope()
					if telescope_builtin == nil then
						telescope_builtin = require 'telescope.builtin'
					end
				end

				vim.keymap.set('n', 'gD', function()
					vim.lsp.buf.declaration()
				end)

				vim.keymap.set('n', 'gd', function()
					vim.lsp.buf.definition()
				end)

				vim.keymap.set('n', 'gr', function()
					vim.lsp.buf.references()
				end)

				vim.keymap.set('n', '<leader>fr', function()
					load_telescope()
					telescope_builtin.lsp_references({
						include_declaration = false
					})
				end)

				vim.keymap.set('n', 'K', function()
					vim.lsp.buf.hover()
				end)

				vim.keymap.set('n', '<leader>lr', function()
					vim.lsp.buf.rename()
				end)

				vim.keymap.set('n', '<leader>ld', function()
					vim.diagnostic.open_float()
				end)

				vim.keymap.set('n', '<leader>la', function()
					vim.lsp.buf.code_action()
				end)

				vim.keymap.set('n', '<leader>lf', function()
					vim.lsp.buf.format()
				end)

				if custom_on_attach then custom_on_attach(client, bufnr) end
			end

			lspconfig[lsp].setup(settings)
		end
	end
}
