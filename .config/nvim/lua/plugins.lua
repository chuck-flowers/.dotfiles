local packer = require('packer')

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


local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
	packerClone = vim.fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		packer_install_path
	})

	packer.sync()
end

local plugin_config_dir = os.getenv('HOME') .. '/.config/nvim/lua/plugins'
local plugin_config_files = ls_files(plugin_config_dir);
packer.startup(function (use)
	-- Use each packer definition in the plugins folder
	for i, pluginFile in ipairs(plugin_config_files) do
		local pluginName = string.gsub(pluginFile, '.lua', '')
		local pluginConfig = require('plugins/' .. pluginName)
		use(pluginConfig)
	end

	-- If this is a bootstrap run, automatically sync
	if packerClone then
		packer.sync()
	end
end)

