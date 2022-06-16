return {
	'L3MON4D3/LuaSnip',
	config = function()
		local luasnip = require('luasnip')

		local s = luasnip.snippet
		local jump = luasnip.jump
		local jumpable = luasnip.jumpable

		-- Nodes
		local t = luasnip.text_node
		local i = luasnip.insert_node

		luasnip.add_snippets('typescript', {
			s(
				'export_function',
				{
					t('export function '),
					i(1, 'function_name'),
					t(' ('),
					i(2, 'params'),
					t('): '),
					i(3, 'return_type'),
					t({ ' {', '' }),
					i(0, 'body'),
					t({ '', '}' })
				}
			)
		})

		vim.keymap.set({ 'i', 's' }, '<c-l>', function()
			if jumpable(1) then
				jump(1)
			end
		end, { silent = true })

		vim.keymap.set({ 'i', 's' }, '<c-h>', function()
			if jumpable(-1) then
				jump(-1)
			end
		end, { silent = true })

	end
}

