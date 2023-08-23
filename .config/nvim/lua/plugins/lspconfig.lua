local function common_keybindings()
	vim.keymap.set('n', 'gD', function()
		vim.lsp.buf.definition()
	end)

	vim.keymap.set('n', 'gd', function()
		vim.lsp.buf.implementation()
	end)

	vim.keymap.set('n', 'gr', function()
		vim.lsp.buf.references()
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

	vim.keymap.set('n', '<leader>lc', function()
		vim.lsp.buf.incoming_calls()
	end)

	vim.keymap.set('n', '<leader>lC', function()
		vim.lsp.buf.incoming_calls()
	end)
end

--- @param lang string
local function register_autoformat(bufnr, lang)
	vim.api.nvim_create_autocmd('BufWritePre', {
		buffer = bufnr,
		desc = 'Auto format ' .. lang .. ' files',
		callback = function()
			vim.lsp.buf.format()
		end
	})
end

return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'folke/neodev.nvim',
		'williamboman/mason-lspconfig.nvim'
	},
	config = function()
		local lspconfig = require('lspconfig')

		-- Build out the custom capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		lspconfig.awk_ls.setup({})
		lspconfig.bashls.setup({})
		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.clangd.setup({
			on_attach = function(_, bufnr)
				common_keybindings()
				register_autoformat(bufnr, 'C/C++')
			end
		})
		lspconfig.dockerls.setup({})
		lspconfig.eslint.setup({
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
		})
		lspconfig.html.setup({
			capabilities = capabilities
		})
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = function(_, bufnr)
				register_autoformat(bufnr, 'JSON')
			end
		})
		lspconfig.lua_ls.setup({
			settings = {
				-- Lua = {
				-- 	runtime = {
				-- 		version = 'LuaJIT'
				-- 	},
				-- 	diagnostics = {
				-- 		globals = { 'vim' }
				-- 	},
				-- 	workspace = {
				-- 		library = vim.api.nvim_get_runtime_file('', true)
				-- 	}
				-- }
			},
			on_attach = function(_, bufnr)
				common_keybindings()
				register_autoformat(bufnr, 'Lua')
			end
		})
		lspconfig.marksman.setup({})
		lspconfig.sqlls.setup({})
		lspconfig.svelte.setup({})
		lspconfig.tsserver.setup({
			on_attach = function() common_keybindings() end
		})
		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					customTags = {
						'!FindInMap sequence',
						'!GetAtt',
						'!Join sequence',
						'!Ref',
						'!Sub'
					},
					schemaStore = {
						enable = true
					},
					schemas = {
						['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose*.yml'
					}
				}
			}
		})
	end
}
