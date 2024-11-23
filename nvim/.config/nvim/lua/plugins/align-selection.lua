return {
	"chuck-flowers/align-selection.nvim",
	keys = {
		{
			"zz",
			function()
				require("align-selection").center()
			end,
			mode = "v",
		},
	},
}

