local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
	vim.notify("Something went wrong with lspconfig: " .. lspconfig)
	return
end

require("conf.lsp.mason")
require("conf.lsp.handlers").setup()
