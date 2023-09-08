return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'L3MON4D3/LuaSnip' },
		{ 'windwp/nvim-autopairs' },
		{ 'dcampos/cmp-emmet-vim' },
		{ 'mattn/emmet-vim' }
	},
	config = function()
		local autopairs_cmp = require('nvim-autopairs.completion.cmp')
		local cmp = require('cmp')
		local luasnip = require('luasnip')

		cmp.event:on('confirm_done', autopairs_cmp.on_confirm_done())

		cmp.setup({
			enabled = true,
			mapping = {
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<CR>'] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true
				}
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered()
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'orgmode' },
				{ name = 'emmet_vim' }
			}
		})
	end
}
