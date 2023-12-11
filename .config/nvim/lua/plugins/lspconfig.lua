local function common_keybindings()
	vim.keymap.set('n', 'gd', function()
		require('trouble').open('lsp_definitions')
	end)

	vim.keymap.set('n', 'gD', function()
		require('trouble').open('lsp_implementations')
	end)

	vim.keymap.set('n', 'gr', function()
		require('trouble').open('lsp_references')
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

	vim.keymap.set('n', '<leader>lc', function()
		vim.lsp.buf.incoming_calls()
	end)

	vim.keymap.set('n', '<leader>lC', function()
		vim.lsp.buf.outgoing_calls()
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
		-- Build out the custom capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require('lspconfig.ui.windows').default_options.border = 'single';

		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
			vim.lsp.handlers.hover, {
				title = 'hover',
				border = 'single'
			}
		)

		require('lspconfig').awk_ls.setup({})
		require('lspconfig').bashls.setup({})
		require('lspconfig').cssls.setup({ capabilities = capabilities })
		require('lspconfig').clangd.setup({
			on_attach = function(_, bufnr)
				common_keybindings()
				register_autoformat(bufnr, 'C/C++')
			end
		})
		require('lspconfig').dockerls.setup({})
		require('lspconfig').elixirls.setup({
			cmd = { vim.fn.stdpath('data') .. '/mason/bin/elixir-ls' },
			on_attach = function(_, bufnr)
				common_keybindings()
				register_autoformat(bufnr, 'Elixir')
			end
		})
		require('lspconfig').eslint.setup({
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
		require('lspconfig').html.setup({
			capabilities = capabilities
		})
		require('lspconfig').jsonls.setup({
			capabilities = capabilities,
			on_attach = function(_, bufnr)
				register_autoformat(bufnr, 'JSON')
			end
		})
		require('lspconfig').lemminx.setup({})
		require('lspconfig').lua_ls.setup({
			on_attach = function(_, bufnr)
				common_keybindings()
				register_autoformat(bufnr, 'Lua')
			end
		})
		require('lspconfig').marksman.setup({})
		require('lspconfig').sqlls.setup({})
		require('lspconfig').svelte.setup({})
		require('lspconfig').tsserver.setup({
			on_attach = function() common_keybindings() end
		})
		require('lspconfig').yamlls.setup({
			capabilities = capabilities,
			settings = {
				yaml = {
					completion = true,
					customTags = {
						'!FindInMap sequence',
						'!GetAtt scalar',
						'!Join sequence',
						'!Ref scalar',
						'!Sub scalar'
					},
					schemas = {
						['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = 'docker-compose*.yml',
						['https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json'] = '*.cf.yml',
						kubernetes = '*.k8s.yml'
					}
				}
			}
		})
	end
}
