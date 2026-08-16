vim.pack.add({
	'https://github.com/rcarriga/nvim-notify'
})

vim.api.nvim_set_hl(0, 'NotifyBackground', { link = 'NormalFloat' })

vim.notify = require('notify')
