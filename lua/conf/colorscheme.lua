local colorscheme = "catppuccin"   -- If your colorscheme comes from a plugin, add it here
local flavour = "catppuccin-latte" -- If your colorscheme has a flavour, at it here

local colorscheme_status_ok, colorscheme_module = pcall(require, colorscheme)
if not colorscheme_status_ok then
	vim.notify("Something went wrong with the colorscheme", vim.log.levels.WARN)
	-- vim.notify("" .. colorscheme_module, vim.log.levels.DEBUG)
	return
end

colorscheme_module.setup({})
vim.cmd("colorscheme " .. flavour)
