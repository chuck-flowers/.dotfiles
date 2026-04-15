local M = {}

local DATA_DIR = vim.fn.stdpath('data')
local MASON_DIR = vim.fs.joinpath(DATA_DIR, 'mason', 'bin')

function M.install_lsp(lsp)
	local mason_name = lsp
	if mason_name == 'lua_ls' then
		mason_name = 'lua-language-server'
	end

	local mason_bin_path = vim.fs.joinpath(MASON_DIR, mason_name)
	if not vim.uv.fs_stat(mason_bin_path) then
		vim.cmd('MasonInstall ' .. mason_name)
	end
end

return M
