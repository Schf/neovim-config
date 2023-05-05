return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					-- "all",

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
				ignore_install = { "phpdoc" },
				highlight = {
					enable = true, -- false will disable the whole extension
				},
				autopairs = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				-- context_commentstring = {
				-- 	enable = true,
				-- 	enable_autocmd = false,
				-- },
				playground = {
					enable = true,
					disable = {},
					updatetime = 25,
					persist_queries = false,
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
		end,
	},
	{ "nvim-treesitter/playground", },
}
