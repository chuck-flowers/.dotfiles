-- Auto wrap the text at 80 characters
vim.bo.textwidth = 80
vim.o.colorcolumn = '80'

-- Turn on spellcheck for org documents
vim.api.nvim_set_option_value('spell', true, { scope = 'local' })
