vim.opt.background = "light"
vim.cmd("colorscheme morning")     -- Sane default before plugins are loaded

require("core.options")
require("core.keymaps")
require("core.plugins")

if packer_bootstrap then
	return
end

require("conf.colorscheme")
require("conf.cmp")
require("conf.lsp")
require("conf.illuminate")
require("conf.telescope")
require("conf.treesitter")
require("conf.autopairs")
require("conf.comment")
