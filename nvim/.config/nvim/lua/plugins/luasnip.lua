return {
	"L3MON4D3/LuaSnip",
	config = function()
		-- Load the snippets from files
		local snippet_dir = vim.fn.stdpath("config") .. "/lua/plugins/luasnip/snippets"
		require("luasnip.loaders.from_lua").load({
			paths = { snippet_dir },
		})

		require("luasnip").filetype_extend("typescriptreact", { "typescript" })
		require("luasnip").filetype_extend("helm", { "yaml" })

		local function safe_jump(offset)
			if require("luasnip").jumpable(offset) then
				require("luasnip").jump(offset)
			end
		end

		local function safe_choice(offset)
			if require("luasnip").choice_active() then
				require("luasnip").change_choice(offset)
			end
		end

		local function safe_jump_next()
			safe_jump(1)
		end
		local function safe_jump_prev()
			safe_jump(-1)
		end
		local function safe_choice_next()
			safe_choice(1)
		end
		local function safe_choice_prev()
			safe_choice(-1)
		end

		-- Key Maps
		vim.keymap.set({ "i", "s" }, "<c-l>", safe_jump_next, { silent = true })
		vim.keymap.set({ "i", "s" }, "<c-h>", safe_jump_prev, { silent = true })
		vim.keymap.set({ "i", "s" }, "<c-j>", safe_choice_next, { silent = true })
		vim.keymap.set({ "i", "s" }, "<c-k>", safe_choice_prev, { silent = true })
	end,
}
