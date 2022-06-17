return {
	'L3MON4D3/LuaSnip',
	config = function()
		-- Modules
		local luasnip = require('luasnip')
		local luasnip_lua_loader = require('luasnip.loaders.from_lua')

		-- Load the snippets from files
		luasnip_lua_loader.load({
			paths = './lua/plugins/luasnip/snippets'
		})

		local function safe_jump_forward()
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			end
		end

		local function safe_jump_backward()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			end
		end

		-- Key Maps
		vim.keymap.set({ 'i', 's' }, '<c-l>', safe_jump_forward, { silent = true })
		vim.keymap.set({ 'i', 's' }, '<c-h>', safe_jump_backward, { silent = true })

	end
}

