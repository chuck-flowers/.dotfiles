return {
	'L3MON4D3/LuaSnip',
	config = function()
		-- Modules
		local luasnip = require('luasnip')
		local luasnip_fmt = require('luasnip.extras.fmt')

		-- LS Functions
		local s = luasnip.snippet
		local jump = luasnip.jump
		local jumpable = luasnip.jumpable
		local fmt = luasnip_fmt.fmt

		-- LS Nodes
		local t = luasnip.text_node
		local i = luasnip.insert_node

		luasnip.add_snippets('typescript', {
			s(
				'export_function',
				fmt(
					'export function {}({}): {} {{\n\t{}\n}}',
					{
						i(1, 'name'),
						i(2, 'params'),
						i(3, 'return_type'),
						i(0, 'body')
					}
				)
			)
		})

		luasnip.add_snippets('typescript', {
			s(
				'export_async_function',
				fmt(
					'export async function {}({}): Promise<{}> {{\n\t{}\n}}',
					{
						i(1, 'name'),
						i(2, 'params'),
						i(3, 'return_type'),
						i(0, 'body')
					}
				)
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

