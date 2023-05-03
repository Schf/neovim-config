local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	vim.notify("Something went wrong with mason", vim.log.levels.WARN)
	-- vim.notify("" .. mason, vim.log.levels.DEBUG)
	return false
end

local masonlspconfig_status_ok, masonlspconfig = pcall(require, "mason-lspconfig")
if not masonlspconfig_status_ok then
	vim.notify("Something went wrong with masonlspconfig", vim.log.levels.WARN)
	-- vim.notify("" .. masonlspconfig, vim.log.levels.DEBUG)
	return false
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("Something went wrong with lspconfig", vim.log.levels.WARN)
	-- vim.notify("" .. lspconfig, vim.log.levels.DEBUG)
	return false
end

local handlers_status_ok, handlers = pcall(require, "conf.lsp.handlers")
if not handlers_status_ok or not handlers then
	vim.notify("Something went wrong with the LSP's handlers module", vim.log.levels.WARN)
	-- vim.notify("" .. handlers, vim.log.levels.DEBUG)
	return false
end

local servers = {
	"lua_ls",
	"clangd",
	"pyright",
	"texlab",
}

-- local servers = require("mason-registry").get_installed_package_names()

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
masonlspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local opts = {}
local on_attach = require("conf.lsp.handlers").on_attach
local capabilities = require("conf.lsp.handlers").capabilities

for _, server in pairs(servers) do
	opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "conf.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
