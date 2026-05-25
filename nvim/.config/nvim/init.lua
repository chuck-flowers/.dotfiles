local fs_utils = require 'utils.fs'

vim.g.mapleader = " "

local ok, err

-- Load Settings
local settings_mods = fs_utils.ls_sub_modules('config.settings')
for _, settings_mod in pairs(settings_mods) do
	ok, err = pcall(require, settings_mod)
	if not ok then
		vim.notify(vim.inspect(err), vim.log.levels.ERROR)
	end
end

-- Load Plugins
local plugin_mods = fs_utils.ls_sub_modules('config.plugins')
for _, plugin_mod in pairs(plugin_mods) do
	ok, err = pcall(require, plugin_mod)
	if not ok then
		vim.notify(vim.inspect(err), vim.log.levels.ERROR)
	end
end

