local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	vim.notify("Something went wrong with which-key", vim.log.levels.WARN)
	-- vim.notify("" .. which_key, vim.log.levels.DEBUG)
	return
end

local setup = {
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
		zindex = 1000,
	},
}

which_key.setup(setup)

local opts = require("conf.whichkey.keymaps").opts
for mode, mappings in pairs(require("conf.whichkey.keymaps")) do
	local mode_opts = vim.tbl_deep_extend("force", { mode = mode }, opts)
	which_key.register(mappings, mode_opts)
end
