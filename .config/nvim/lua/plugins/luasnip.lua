return {
	'L3MON4D3/LuaSnip',
	config = function()
		-- Modules
		local luasnip = require('luasnip')
		local luasnip_lua_loader = require('luasnip.loaders.from_lua')

		-- Load the snippets from files
		local snippet_dir = vim.fn.stdpath('config') .. '/lua/plugins/luasnip/snippets'
		luasnip_lua_loader.load({
			paths = snippet_dir
		})

		local function safe_jump(offset)
			if luasnip.jumpable(offset) then
				luasnip.jump(offset)
			end
		end

		local function safe_jump_next() safe_jump(1) end
		local function safe_jump_prev() safe_jump(-1) end

		-- Key Maps
		vim.keymap.set({ 'i', 's' }, '<c-l>', safe_jump_next, { silent = true })
		vim.keymap.set({ 'i', 's' }, '<c-h>', safe_jump_prev, { silent = true })

	end
}

