vim.pack.add({
	'https://github.com/L3MON4D3/LuaSnip'
})

-- Load the snippets from files
local snippet_dir = vim.fn.stdpath("config") .. "/lua/config/luasnip"
require("luasnip.loaders.from_lua").load({
	paths = { snippet_dir },
})

require("luasnip").filetype_extend("typescriptreact", { "typescript" })
require("luasnip").filetype_extend("helm", { "yaml" })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if require("luasnip").jumpable(1) then
		require("luasnip").jump(1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if require("luasnip").jumpable(-1) then
		require("luasnip").jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if require("luasnip").choice_active() then
		require("luasnip").change_choice(1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if require("luasnip").choice_active() then
		require("luasnip").change_choice(-1)
	end
end, { silent = true })
