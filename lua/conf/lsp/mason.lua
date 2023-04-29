local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	vim.notify("Something went wrong with mason: " .. mason)
	return
end

local masonlspconfig_status_ok, masonlspconfig = pcall(require, "mason-lspconfig")
if not masonlspconfig_status_ok then
	vim.notify("Something went wrong with mason-lspconfig: " .. masonlspconfig)
	return
end

local servers = {
	"lua_ls",
	"clangd",
	"pylsp",
	"texlab",
}

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

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("Something went wrong with lspconfig" .. lspconfig)
	return
end

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
