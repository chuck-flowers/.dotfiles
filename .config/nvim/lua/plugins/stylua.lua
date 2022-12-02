return {
	"wesleimp/stylua.nvim",
	ft = { "lua" },
	requires = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local stylua = require("stylua")

		local auto_group = vim.api.nvim_create_augroup("Stylua", { clear = true })
		vim.api.nvim_create_autocmd({
			"BufWritePre",
		}, {
			pattern = { "*.lua" },
			group = auto_group,
			callback = function()
				print("stylua auto command")
				stylua.format()
			end,
		})
	end,
}
