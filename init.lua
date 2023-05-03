-- Sane default colorscheme before plugins are loaded
vim.opt.background = "light"
vim.cmd("colorscheme morning")

require("core.options")
require("core.keymaps")
require("core.plugins")

if Packer_bootstrap then
	return
end

require("conf.lsp")
require("conf.illuminate")
require("conf.telescope")
require("conf.treesitter")
require("conf.comment")
require("conf.whichkey")
