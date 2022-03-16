local trouble = require('trouble')

vim.api.nvim_set_keymap('n', '<Leader>t', ':TroubleToggle<CR>', { noremap = true })

trouble.setup({

})
