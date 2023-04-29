vim.opt.background = "light"
vim.cmd("colorscheme morning")     -- Sane default in case no colorscheme plugin was chosen

local colorscheme = "catppuccin"   -- If your colorscheme comes from a plugin, add it here
local flavour = "catppuccin-latte" -- If your colorscheme has a flavour, at it here

local colorscheme_status_ok, colorscheme_module = pcall(require, colorscheme)

-- colorscheme_module.setup({}) -- In case setup is needed

if colorscheme_status_ok then
	vim.cmd("colorscheme " .. flavour)
elseif not packer_bootstrap then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
