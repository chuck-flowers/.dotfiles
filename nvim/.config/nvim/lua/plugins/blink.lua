return {
	'saghen/blink.cmp',
	version = '0.8.2',
	dependencies = {
		'L3MON4D3/LuaSnip'
	},
	opts = {
		keymap = { preset = 'default' },
		sources = {
			default = { 'lsp', 'path', 'luasnip', 'buffer' },
		},
		snippets = {
			expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
			active = function(filter)
				if filter and filter.direction then
					return require('luasnip').jumpable(filter.direction)
				end
				return require('luasnip').in_snippet()
			end,
			jump = function(direction) require('luasnip').jump(direction) end,
		}
	},
}
