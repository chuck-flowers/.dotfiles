return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'L3MON4D3/LuaSnip' },
		{ 'windwp/nvim-autopairs' },
	},
	config = function()
		require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())

		require('cmp').setup({
			enabled = true,
			mapping = {
				['<C-p>'] = require('cmp').mapping.select_prev_item(),
				['<C-n>'] = require('cmp').mapping.select_next_item(),
				['<C-Space>'] = require('cmp').mapping(require('cmp').mapping.complete(), { 'i', 'c' }),
				['<C-y>'] = require('cmp').mapping.confirm {
					behavior = require('cmp').ConfirmBehavior.Replace,
					select = true
				}
			},
			window = {
				completion = require('cmp').config.window.bordered(),
				documentation = require('cmp').config.window.bordered()
			},
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'orgmode' },
			}
		})
	end
}
