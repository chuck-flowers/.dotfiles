local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

-- local packer_augroup = create_augroup('packer_user_config', {
-- 	clear = false
-- })
--
-- create_autocmd({ 'BufWritePost' }, {
-- 	pattern = {
-- 		'plugins.lua',
-- 		'*/.config/nvim/lua/plugins/*.lua'
-- 	},
-- 	group = packer_augroup,
-- 	callback = function ()
-- 		local packer = require('packer')
-- 		packer.compile()
-- 	end
-- })
--
