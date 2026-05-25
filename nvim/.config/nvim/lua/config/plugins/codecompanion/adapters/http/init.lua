local fs_utils = require 'utils.fs'

local ROOT_MODULE = 'config.plugins.codecompanion.adapters.http'

local adapters = {}

for _, module in ipairs(fs_utils.ls_sub_modules(ROOT_MODULE)) do
	local name = module:sub(ROOT_MODULE:len() + 2)
	adapters[name] = require(module)
end

return adapters

