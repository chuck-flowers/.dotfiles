vim.pack.add({
	'https://github.com/L3MON4D3/LuaSnip'
})

require('luasnip').setup({

})

-- Load the snippets from files
require("luasnip.loaders.from_lua").load({
	paths = {
		vim.fn.stdpath("config") .. "/lua/config/plugins/luasnip/snippets/"
	},
})

require("luasnip").filetype_extend("typescriptreact", { "typescript" })
require("luasnip").filetype_extend("helm", { "yaml" })

vim.keymap.set({ 'n' }, '<leader>s', function()
	local ft = vim.bo.filetype
	local snippets = require('luasnip').get_snippets(ft)
	if #snippets == 0 then
		vim.notify(string.format('No snippets found for file type "%s"', ft), vim.log.levels.WARN)
		return
	end

	--- @type string[]
	local options = {}
	for _, snippet in ipairs(snippets) do
		table.insert(options, snippet.name)
	end

	vim.ui.select(options, {}, function(_, idx)
		if idx then
			local selected = snippets[idx]
			require('luasnip').snip_expand(selected)
		end
	end)
end)

-- Snippet Expansion
vim.keymap.set({ "i" }, '<c-k>', require('luasnip').expand, {
	desc = 'expand snippet'
})

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
