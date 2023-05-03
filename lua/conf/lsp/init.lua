local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("Something went wrong with lspconfig", vim.log.levels.WARN)
	-- vim.notify("" .. lspconfig, vim.log.levels.DEBUG)
	return
end

if require("conf.lsp.mason") then
require("conf.lsp.handlers").setup()
end
