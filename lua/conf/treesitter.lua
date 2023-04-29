local config_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not config_status_ok then
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
	indent = {
		enable = true,
	},
})
