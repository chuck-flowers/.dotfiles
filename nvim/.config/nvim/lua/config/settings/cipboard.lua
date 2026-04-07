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
