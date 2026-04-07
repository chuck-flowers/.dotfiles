local M = {}

function M.ls_sub_modules(root_module)
	local to_return = {}

	local root_mod_components = vim.fn.split(root_module, '\\.')
	local config_dir = vim.fn.stdpath('config')
	local plugins_dir = vim.fs.joinpath(config_dir, 'lua', unpack(root_mod_components))
	local plugin_files = vim.fn.split(vim.fn.glob(plugins_dir .. '/*.lua'), '\n')
	for _, plugin_file in pairs(plugin_files) do
		local name = plugin_file:sub(plugins_dir:len() + 2):gsub('%.lua$', '')
		table.insert(to_return, root_module .. '.' .. name)
	end

	return to_return
end

return M
