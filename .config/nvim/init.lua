local cmp = require('cmp')
local lspconfig = require('lspconfig')
local lualine = require('lualine')
local telescope = require('telescope')

-- Show line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Configure color scheme
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- Configure tabbing behavior
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Configure the line wrapping behavior
vim.o.wrap = false

-- Configure leader key
vim.g.mapleader = " "

-- Configure the dashboard
vim.g.startify_bookmarks = { { c = '~/.config/nvim/init.lua' } }
vim.g.startify_lists = {
	{ type = 'sessions', header = {'Projects'} },
	{ type = 'bookmarks', header = {'Bookmarks'} }
}

-- Configure completions
cmp.setup({
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}
	},
	snippet = {
		expand = function (args)
			vim.fn['vsnip#anonymous'](args.body)
		end
	},
	sources = {
		{ name = 'nvim_lsp' }
	}
})

-- Configure fugitive
vim.api.nvim_set_keymap('n', '<Leader>Gs', ':Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>Gc', ':Git commit<CR>', { noremap = true })

-- Configure LSP clients
for _, lsp in ipairs({
	'bashls',
	'clangd',
	'dockerls',
	'pylsp',
	'rust_analyzer',
	'tsserver'
}) do
	lspconfig[lsp].setup {
		on_attach = function (client, bufnr)
			local opts = { noremap=true, silent=true }

			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
			buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
			buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts);
			buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
		end
	}
end

-- Configure lualine
lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto'
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'filename' },
		lualine_c = { 'progress', 'location' },
		lualine_x = { 'branch', 'diff', 'diagnostics' },
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {},
	tabline = {},
	extensions = {}
})

-- Configure nerdtree
vim.api.nvim_set_keymap('n', '<Leader>N', ':NERDTreeToggle<CR>', { noremap = true })

-- Configure telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', ':Telescope git_branches<CR>', { noremap = true })
telescope.setup({
	defaults = {
		file_ignore_patterns = { 'node_modules' }
	}
})

