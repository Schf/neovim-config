require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.colorscheme")

if packer_bootstrap then
	return
end

require("conf.cmp")
require("conf.lsp")
require("conf.illuminate")
