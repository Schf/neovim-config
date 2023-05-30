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
					"bash", "c", "cmake", "cpp", "cuda", "git_config", "git_rebase",
					"gitattributes", "gitcommit", "gitignore", "java", "json", "llvm",
					"lua", "markdown", "markdown_inline", "python", "rust", "toml",
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
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
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
	{ "JoosepAlviste/nvim-ts-context-commentstring", },
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				providers = { "treesitter", "regex" },
				delay = 0,
			})
		end
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			local ufo = require("ufo")

			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			Map("n", "zR", ufo.openAllFolds, "Open all folds")
			Map("n", "zM", ufo.closeAllFolds, "Close all folds")

			ufo.setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end
			})
		end
	},
}
