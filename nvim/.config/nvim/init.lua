-- Show line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Configures the global status line
vim.o.laststatus = 3

-- Configure tabbing behavior
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true

-- Configure search behavior
vim.o.ignorecase = true
vim.o.smartcase = true

-- Configure the line wrapping behavior
vim.o.wrap = false

-- Configure terminal
vim.o.termguicolors = true

-- Configure splitting behavior
vim.o.splitbelow = true
vim.o.splitright = true

-- Windows
vim.o.winborder = "rounded"

-- Configure clipboard when on WSL
if os.getenv("WSL_DISTRO_NAME") ~= nil then
	vim.g.clipboard = {
		name = "WSL Clipboard",
		copy = {
			["+"] = { "clip.exe" },
			["*"] = { "clip.exe" },
		},
		paste = {
			["+"] = { "bash", "-c", "powershell.exe -Command Get-Clipboard | tr -d '\r'" },
		},
	}
end

require("editorconfig")

-- Keybindings
vim.g.mapleader = " "
local keybind_dir = vim.fn.stdpath("config") .. "/lua/key-bindings"
local keybind_files = vim.split(vim.fn.glob(keybind_dir .. "/*"), "\n", { trimempty = true })
for _, file in ipairs(keybind_files) do
	local mod_file = file:sub(#keybind_dir + 2)
	local mod_name = "key-bindings." .. mod_file:sub(0, #mod_file - 4)
	require(mod_name)
end

local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins', {
	ui = {
		border = "rounded"
	}
})
