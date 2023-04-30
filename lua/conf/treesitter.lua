local config_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not config_status_ok then
	vim.notify("Something went wrong with treesitter.configs", vim.log.levels.WARN)
	-- vim.notify("" .. configs, vim.log.levels.DEBUG)
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"cuda",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"java",
		"json",
		"llvm",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"toml",
		"yaml",
	},
	-- one of "all" or a list of languages
	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,          -- false will disable the whole extension
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,   -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},
})
