return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nanotee/sqls.nvim",
	},
	config = function()
		vim.diagnostic.config({
			float = {
				border = "single",
			},
		})

		require("lspconfig.ui.windows").default_options.border = "single"

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			title = "hover",
			border = "single",
		})

		local lsp_config_dir = vim.fn.stdpath("config") .. "/lua/plugins/lsp"
		local files = vim.split(vim.fn.glob(lsp_config_dir .. "/*"), "\n", { trimempty = true })

		for _, file in ipairs(files) do
			local mod_file = file:sub(#lsp_config_dir + 2)
			local mod_name = mod_file:sub(0, #mod_file - 4)
			if file ~= "utils" then
				require("plugins.lsp." .. mod_name)
			end
		end
	end,
}

