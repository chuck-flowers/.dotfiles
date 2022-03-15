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
		{ name = 'nvim_lsp' }
	}
})

