return {
	"Nguyen-Hoang-Nam/nvim-preview-csv",
	ft = { "csv" },
	config = function()
		local preview_csv = require("nvim-preview-csv")

		vim.api.nvim_buf_create_user_command(0, "PreviewCsv", preview_csv.preview, {})

		preview_csv.setup({})
	end,
}

