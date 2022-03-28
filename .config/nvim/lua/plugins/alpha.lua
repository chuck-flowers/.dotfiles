local bookmark_defs = {
	{ key = 'c', file = '~/.config/nvim/init.lua' },
	{ key = 'w', file = '~/.config/qtile/config.py' },
	{ key = 'o', file = '~/org/notes.org' }
}

local projects = { }

function create_bookmark_buttons()
	local bookmark_buttons = {}

	for i, def in ipairs(bookmark_defs) do
		table.insert(bookmark_buttons, {
			type = 'button',
			val = ': ' .. def.file,
			on_press = function()
				local key = vim.api.nvim_replace_termcodes(def.key, true, false, true)
				vim.api.nvim_feedkeys(key, "normal", false)
			end,
			opts = {
				position = 'left',
				hl = 'Tag',
				shortcut = def.key,
				keymap = {
					"n",
					def.key,
					'<cmd>e ' .. def.file .. ' <CR>:cd %:h<CR>',
					{
						noremap = false,
						silent = true,
						nowait = true
					}
				}
			}
		})
	end

	return bookmark_buttons
end

function create_project_buttons()

end

return {
	'goolord/alpha-nvim',
	config = function()
		local alpha = require('alpha')
		local alpha_startify = require('alpha.themes.startify')

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

		local BOOKMARKS = {
			type = 'group',
			val = {
				{ type = 'text', val = 'Bookmarks', opts = { hl = 'Type' } },
				{
					type = 'group',
					val = create_bookmark_buttons()
				}
			},
			opts = {
				spacing = INTRA_SECTION_SPACING
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

