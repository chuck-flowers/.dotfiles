return {
	"feline-nvim/feline.nvim",
	dependencies = {
		"ellisonleao/gruvbox.nvim",
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local feline = require("feline")
		local git_provider = require("feline.providers.git")
		local lsp_provider = require("feline.providers.lsp")
		local mode_provider = require("feline.providers.vi_mode")

		local gruvbox = require("gruvbox").palette

		-- Padding functions
		local pad = function(text)
			return " " .. text .. " "
		end
		local components = {
			errors = {
				provider = function()
					local errors = lsp_provider.diagnostic_errors() or ""
					if errors == "" then
						return ""
					end

					return pad(" " .. errors)
				end,
				hl = {
					fg = "red",
					bg = "NONE",
				},
			},
			filename = {
				name = "filename",
				provider = {
					name = "file_info",
					opts = {
						type = "unique",
					},
				},
			},
			filetype = {
				name = "filetype",
				provider = function()
					local ft = vim.bo.filetype
					if ft == "" then
						ft = "[none]"
					end

					local lsp_client_names = lsp_provider.lsp_client_names()

					--- @type string[]
					local clients = {}
					for c in string.gmatch(lsp_client_names, "[^ ]+") do
						table.insert(clients, c)
					end

					if #clients > 0 then
						return pad(ft .. " (󱘖 " .. #clients .. ")")
					else
						return pad(ft)
					end
				end,
				left_sep = "slant_left_2",
				right_sep = "slant_right",
				hl = {
					bg = "white",
					fg = "NONE",
				},
			},
			gitBranch = {
				provider = function()
					local branch = git_provider.git_branch() or ""
					if branch == "" then
						return ""
					end

					return pad(branch)
				end,
				left_sep = "slant_left",
				hl = {
					fg = "NONE",
					bg = "cyan",
				},
			},
			gitLinesAdded = {
				provider = function()
					local lines = git_provider.git_diff_added() or ""
					if lines == "" then
						return ""
					end

					return pad(" " .. lines)
				end,
				left_sep = "slant_left",
				right_sep = "slant_right_2",
				hl = {
					fg = "NONE",
					bg = "green",
				},
			},
			gitLinesChanged = {
				provider = function()
					local lines = git_provider.git_diff_changed() or ""
					if lines == "" then
						return ""
					end

					return pad(" " .. lines)
				end,
				left_sep = "slant_left",
				right_sep = "slant_right_2",
				hl = {
					fg = "NONE",
					bg = "yellow",
				},
			},
			gitLinesRemoved = {
				provider = function()
					local lines = git_provider.git_diff_removed() or ""
					if lines == "" then
						return ""
					end

					return pad(" " .. lines)
				end,
				left_sep = "slant_left",
				right_sep = "slant_right_2",
				hl = {
					fg = "NONE",
					bg = "red",
				},
			},
			hints = {
				provider = function()
					local hints = lsp_provider.diagnostic_hints() or ""
					if hints == "" then
						return ""
					end

					return pad(" " .. hints)
				end,
				hl = {
					fg = "white",
					bg = "NONE",
				},
			},
			info = {
				provider = function()
					local info = lsp_provider.diagnostic_info() or ""
					if info == "" then
						return ""
					end

					return pad(" " .. info)
				end,
				hl = {
					fg = "cyan",
					bg = "NONE",
				},
			},
			mode = {
				name = "mode",
				provider = function()
					return " " .. mode_provider.get_vim_mode() .. " "
				end,
				right_sep = "slant_right",
				hl = function()
					return {
						fg = "NONE",
						bg = mode_provider.get_mode_color(),
					}
				end,
			},
			warnings = {
				provider = function()
					local warnings = lsp_provider.diagnostic_warnings() or ""
					if warnings == "" then
						return ""
					end

					return pad(" " .. warnings)
				end,
				hl = {
					fg = "yellow",
					bg = "NONE",
				},
			},
		}

		local sections = {
			left = {
				components.mode,
				components.filetype,
				components.errors,
				components.warnings,
				components.info,
				components.hints,
			},
			middle = {
				components.filename,
			},
			right = {
				components.gitLinesAdded,
				components.gitLinesChanged,
				components.gitLinesRemoved,
				components.gitBranch,
			},
		}

		feline.setup({
			components = {
				active = {
					sections.left,
					sections.middle,
					sections.right,
				},
				inactive = {
					sections.left,
					sections.middle,
					sections.right,
				},
			},
			theme = {
				fg = gruvbox.light0,
				bg = "NONE",
				NONE = gruvbox.dark0,
				skyblue = gruvbox.bright_blue,
				cyan = gruvbox.neutral_blue,
				green = gruvbox.bright_green,
				oceanblue = gruvbox.faded_blue,
				magenta = gruvbox.bright_purple,
				orange = gruvbox.bright_orange,
				red = gruvbox.bright_red,
				violet = gruvbox.bright_purple,
				white = gruvbox.light0,
				yellow = gruvbox.bright_yellow,
			},
		})
	end,
}
