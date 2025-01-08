return {
	"saghen/blink.cmp",
	version = "0.10.0",
	dependencies = {
		"L3MON4D3/LuaSnip",
	},
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
		snippets = {
			preset = "luasnip",
		},
	},
}
