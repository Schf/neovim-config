vim.cmd "colorscheme morning"

local colorscheme = "morning" -- If your colorscheme comes from a plugin, add it here

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not packer_bootstrap and not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

