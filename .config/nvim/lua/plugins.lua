-- Lists all non-hidden files in a provided directory
local function ls_files(directory)
	local to_return = {}
	local process = io.popen('ls "'..directory..'"')

	local i = 1;
	for file in process:lines() do
		to_return[i] = file
		i = i + 1
	end

	process:close()
	return to_return
end

local plugin_config_dir = os.getenv('HOME') .. '/.config/nvim/lua/plugins'
local plugin_config_files = ls_files(plugin_config_dir);
for i, plugin_config_file in ipairs(plugin_config_files) do
	local module_name = string.gsub(plugin_config_file, '%.lua', '')
	require('plugins/'..module_name)
end

