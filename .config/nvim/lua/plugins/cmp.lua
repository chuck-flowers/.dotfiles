return {
	'hrsh7th/nvim-cmp',
	requires = {
		{ 'neovim/nvim-lspconfig' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'L3MON4D3/LuaSnip' }
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')

		cmp.setup({
			mapping = {
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true
				}
			},
			snippet = {
				expand = function (args)
					luasnip.lsp_expand(args.body)
				end
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }
			}
		})
	end
}

