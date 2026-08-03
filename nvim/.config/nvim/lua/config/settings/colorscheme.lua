local fs_utils = require('utils.fs')

-- Load Themes
local plugin_mods = fs_utils.ls_sub_modules('config.plugins.themes')
for _, plugin_mod in pairs(plugin_mods) do
	local ok, err = pcall(require, plugin_mod)
	if not ok then
		vim.notify(vim.inspect(err), vim.log.levels.ERROR)
	end
end

-- Apply Theme
vim.o.background = 'dark'
vim.cmd([[ colorscheme gruvbox ]])
