local M = {}

local DATA_DIR = vim.fn.stdpath('data')
local MASON_DIR = vim.fs.joinpath(DATA_DIR, 'mason', 'bin')

--- @param lsp string
--- @return string
local function map_lspconfig_to_mason(lsp)
	if lsp == 'cssls' then
		return 'css-lsp'
	elseif lsp == 'docker_language_server' then
		return 'dockerfile-language-server'
	elseif lsp == 'eslint' then
		return 'eslint-lsp'
	elseif lsp == 'lua_ls' then
		return 'lua-language-server'
	elseif lsp == 'stylelint_lsp' then
		return 'stylelint'
	elseif lsp == 'ts_ls' then
		return 'typescript-language-server'
	elseif lsp == 'yamlls' then
		return 'yaml-language-server'
	else
		return lsp
	end
end

--- @param lsp string
--- @param config? table
function M.enable_lsp(lsp, config)
	if config then
		vim.lsp.config(lsp, config)
	end

	vim.lsp.enable(lsp)
end

--- Ensures the LSP is installed via Mason
--- @param lsp string
function M.install_lsp(lsp)
	--- @type string
	local mason_name = map_lspconfig_to_mason(lsp)

	-- Determine if installed
	local mason_bin_path = vim.fs.joinpath(MASON_DIR, mason_name)
	local is_installed = vim.uv.fs_stat(mason_bin_path)

	-- If not installed, then install
	if not is_installed then
		vim.cmd('MasonInstall ' .. mason_name)
	end
end

return M

