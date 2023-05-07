local function lsp_keymaps(bufnr)
	local opts = { buffer = bufnr, remap = false, silent = true }
	local pref = "<leader>l"

	Map("n", pref .. "a", vim.lsp.buf.code_action, "Code Action", opts)
	Map("n", pref .. "d", vim.lsp.buf.definition, "Go to Definition", opts)
	-- Map("n", pref .. "D", vim.lsp.buf.declaration, "Go to Declaration", opts)
	Map("n", pref .. "D",
		"<cmd>Telescope diagnostics bufnr=0<cr>",
		"Document Diagnostics", opts
	)
	Map("n", pref .. "f",
		"<cmd>lua vim.lsp.buf.format{async=true}<cr>",
		"Format", opts
	)
	-- Map("n", pref .. "F", vim.diagnostics.open_float, "Open Float", opts)
	Map("n", pref .. "i", vim.cmd.LspInfo, "Info", opts)
	-- Map("n", pref .. "I", vim.lsp.buf.implementation, "Go to Implementation", opts)
	Map("n", pref .. "j", vim.diagnostic.goto_next, "Next Diagnostic", opts)
	Map("n", pref .. "k", vim.diagnostic.goto_prev, "Prev Diagnostic", opts)
	Map("n", pref .. "L", vim.lsp.codelens.run, "CodeLens Action", opts)
	Map("n", pref .. "q", vim.diagnostic.setloclist, "Quickfix", opts)
	Map("n", pref .. "r", vim.lsp.buf.rename, "Rename", opts)
	Map("n", pref .. "R", vim.lsp.buf.references, "References", opts)
	Map("n", pref .. "s",
		"<cmd>Telescope lsp_document_symbols<cr>",
		"Document Symbols", opts
	)
	Map("n", pref .. "S",
		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		"Workspace Symbols", opts
	)
	Map("n", pref .. "W",
		"<cmd>Telescope diagnostics<cr>",
		"Workspace Diagnostics", opts
	)
end

local function mason_lspconfig_config()
	require("mason").setup({})

	local servers = { "lua_ls", "clangd", "pyright", "texlab", }
	local mason_lspconfig = require("mason-lspconfig")
	mason_lspconfig.setup({
		ensure_installed = servers,
		automatic_installation = true,
	})

	-- Capabilities
	local cap = vim.lsp.protocol.make_client_capabilities()
	cap.textDocument.completion.completionItem.snippetSupport = true
	cap = require("cmp_nvim_lsp").default_capabilities(cap)

	-- On attach
	local function att(client, bufnr)
		lsp_keymaps(bufnr)
	end

	local lspconfig = require("lspconfig")
	local got_servers = mason_lspconfig.get_installed_servers()
	got_servers = got_servers or {}
	servers = vim.tbl_deep_extend("force", got_servers, servers)

	for _, server in pairs(servers) do
		local opts = {
			on_attach = att,
			capabilities = cap,
		}

		local require_ok, conf_opts = pcall(
			require, "plugins.lsp.settings." .. server
		)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		lspconfig[server].setup(opts)
	end

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn",  text = "" },
		{ name = "DiagnosticSignHint",  text = "" },
		{ name = "DiagnosticSignInfo",  text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(
			sign.name,
			{ texthl = sign.name, text = sign.text, numhl = "" }
		)
	end

	local config = {
		virtual_text = true, -- text at end of line
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		vim.lsp.handlers.hover,
		{ border = "rounded", }
	)

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "rounded", }
	)
end

return {
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = mason_lspconfig_config,
	},
	{ "mfussenegger/nvim-dap" },
	{ "jose-elias-alvarez/null-ls.nvim" },
}
