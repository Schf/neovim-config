local colorscheme = "catppuccin"   -- If your colorscheme comes from a plugin, add it here
local flavour = "catppuccin-latte" -- If your colorscheme has a flavour, at it here

local colorscheme_status_ok, colorscheme_module = pcall(require, colorscheme)

if colorscheme_status_ok then
	colorscheme_module.setup({})
	vim.cmd("colorscheme " .. flavour)
else
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
