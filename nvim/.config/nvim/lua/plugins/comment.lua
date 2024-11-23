return {
	"numToStr/Comment.nvim",
	ft = {
		"cpp",
		"dockerfile",
		"lua",
		"make",
		"sh",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	config = function()
		local Comment = require("Comment")

		Comment.setup()
	end,
}
