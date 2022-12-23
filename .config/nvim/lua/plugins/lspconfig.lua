return {
	'neovim/nvim-lspconfig',
	requires = {
		'nanotee/sqls.nvim'
	},
	config = function()
		local lspconfig = require('lspconfig')

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local lsps = {
			awk_ls = {},
			bashls = {},
			clangd = {},
			dockerls = {},
			graphql = {},
			html = {
				capabilities = capabilities
			},
			jsonls = {
				capabilities = capabilities
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
			sqls = {},
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
							library = vim.api.nvim_get_runtime_file('', true)
						}
					}
				}
			},
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
			settings.on_attach = function(client, bufnr)
				local packer = require 'packer'

				local telescope_builtin = nil
				local function load_telescope()
					if telescope_builtin == nil then
						telescope_builtin = require 'telescope.builtin'
					end
				end

				if lsp == 'sqls' then
					require('sqls').on_attach(client, bufnr)
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

				vim.keymap.set('n', '<leader>fr', function ()
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

				vim.keymap.set('n', '<leader>la', function()
					vim.lsp.buf.code_action()
				end)

				vim.keymap.set('n', '<leader>lf', function()
					vim.lsp.buf.format()
				end)
			end

			lspconfig[lsp].setup(settings)
		end
	end
}

