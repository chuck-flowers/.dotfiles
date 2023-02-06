local bookmark_defs = {
	{ key = 'c', file = '~/.config/nvim/init.lua' },
	{ key = 'w', file = '~/.config/qtile/config.py' },
	{ key = 'o', file = '~/org/notes.org' }
}

return {
	'goolord/alpha-nvim',
	config = function()
		local alpha = require('alpha')

		vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Alpha<CR>', { noremap = true })

		local INTRA_SECTION_SPACING = 1
		local INTER_SECTION_SPACING = 2

		local HEADER = {
			type = 'group',
			val = {
				{
					type = 'text',
					val = {
						[[                               __                ]],
						[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
						[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
						[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
						[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
						[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
					},
					opts = {
						hl = 'Type',
						position = 'center'
					}
				}
			}
		}

		local PROJECTS = {
			type = 'group',
			val = {
				{ type = 'text', val = 'Projects', opts = { hl = 'Type' } },
				{
					type = 'group',
					val = create_project_buttons()
				}
			},
			opts = {
				spacing = INTRA_SECTION_SPACING
			}
		}

		alpha.setup({
			layout = {
				{
					type = 'group',
					val = {
						HEADER,
						BOOKMARKS,
						PROJECTS
					},
					opts = {
						spacing = INTER_SECTION_SPACING
					}
				}
			},
			opts = {
				margin = 3
			}
		})
	end
}

