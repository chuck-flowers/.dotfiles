local fs_utils = require 'utils.fs'

vim.g.mapleader = " "

-- Load Settings
local settings_mods = fs_utils.ls_sub_modules('config.settings')
for _, settings_mod in pairs(settings_mods) do
	require(settings_mod)
end

-- Load Plugins
local plugin_mods = fs_utils.ls_sub_modules('config.plugins')
for _, plugin_mod in pairs(plugin_mods) do
	require(plugin_mod)
end

