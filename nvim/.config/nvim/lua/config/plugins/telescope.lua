vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope-ui-select.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
})

local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
			},
			n = {
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
			},
		},
		vimgrep_arguments = {
		  'rg',
		  '--color=never',
		  '--no-heading',
		  '--with-filename',
		  '--line-number',
		  '--column',
		  '--smart-case',
		  '--follow',
		},
	},
	extensions = {
		['ui-select'] = {}
	},
})

telescope.load_extension("ui-select")

----------------
-- NAVIGATION --
----------------

vim.keymap.set('n', '<leader>ff', function ()
	require('telescope.builtin').find_files({ follow = true, hidden = true })
end)

vim.keymap.set('n', '<leader>ft', function ()
	require('telescope.builtin').live_grep({ follow = true, hidden = true })
end)

vim.keymap.set('n', '<leader>fc', function ()
	require('telescope.builtin').find_files({ cwd='~/.config', follow = true, hidden = true })
end)

vim.keymap.set('n', '<leader>fb', function ()
	require('telescope.builtin').buffers()
end)

---------
-- LSP --
---------

vim.keymap.set('n', '<leader>fs', function ()
	require('telescope.builtin').lsp_dynamic_workspace_symbols()
end)

vim.keymap.set('n', '<leader>fd', function ()
	require('telescope.builtin').diagnostics()
end)

----------
-- DOCS --
----------

vim.keymap.set('n', '<leader>fh', function ()
	require('telescope.builtin').help_tags()
end)

vim.keymap.set('n', '<leader>fm', function ()
	require('telescope.builtin').man_pages()
end)

vim.keymap.set('n', '<leader>fk', function ()
	require('telescope.builtin').keymaps()
end)

----------
-- MISC --
----------

vim.keymap.set('n', '<leader>fe', function ()
	require('telescope.builtin').filetypes()
end)

