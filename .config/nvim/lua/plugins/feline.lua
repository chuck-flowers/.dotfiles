return {
	'feline-nvim/feline.nvim',
	config = function()
		local feline = require 'feline'
		local vi_mode = require 'feline.providers.vi_mode'

		local gruvbox = require 'gruvbox.palette'

		local components = {
			branch = {
				provider = 'git_branch',
				right_sep = 'slant_left',
				hl = {
					fg = 'black',
					bg = 'cyan'
				}
			},
			errors = {
				provider = 'diagnostic_errors',
				left_sep = 'slant_left_2',
				right_sep = 'slant_right',
				hl = {
					fg = 'red',
					bg = 'black'
				}
			},
			filename = {
				name = 'filename',
				provider = {
					name = 'file_info',
					opts = {
						type = 'relative-short'
					}
				}
			},
			filetype = {
				name = 'filetype',
				provider = function()
					local ft = vim.bo.filetype
					if ft == '' then
						return ' [none] '
					else
						return ' ' .. ft:lower() .. ' '
					end
				end,
				left_sep = 'slant_left_2',
				right_sep = 'slant_right',
				hl = {
					bg = 'white',
					fg = 'black'
				}
			},
			hints = {
				provider = 'diagnostic_hints',
				left_sep = 'slant_left_2',
				right_sep = 'slant_right',
				hl = {
					fg = 'white',
					bg = 'black'
				}
			},
			info = {
				provider = 'diagnostic_info',
				left_sep = 'slant_left_2',
				right_sep = 'slant_right',
				hl = {
					fg = 'cyan',
					bg = 'black'
				}
			},
			mode = {
				name = 'mode',
				provider = function()
					return ' ' .. vi_mode.get_vim_mode() .. ' '
				end,
				right_sep = 'slant_right',
				hl = function()
					return {
						fg = 'black',
						bg = vi_mode.get_mode_color()
					}
				end
			},
			warnings = {
				provider = 'diagnostic_warnings',
				left_sep = 'slant_left_2',
				right_sep = 'slant_right',
				hl = {
					fg = 'yellow',
					bg = 'black'
				}
			}
		}

		local sections = {
			left = {
				components.mode,
				components.filetype,
				components.errors,
				components.warnings,
				components.info,
				components.hints
			},
			middle = {
				components.filename
			},
			right = {
				components.branch
			}
		}

		feline.setup({
			components = {
				active = {
					sections.left,
					sections.middle,
					sections.right
				},
				inactive = {
					sections.left,
					sections.middle,
					sections.right
				}
			},
			theme = {
				fg = gruvbox.light0,
				bg = gruvbox.dark0,
				black = gruvbox.dark0,
				skyblue = gruvbox.bright_blue,
				cyan = gruvbox.neutral_blue,
				green = gruvbox.bright_green,
				oceanblue = gruvbox.faded_blue,
				magenta = gruvbox.bright_purple,
				orange = gruvbox.bright_orange,
				red = gruvbox.bright_red,
				violet = gruvbox.bright_purple,
				white = gruvbox.light0,
				yellow = gruvbox.bright_yellow
			}
		})
	end
}
