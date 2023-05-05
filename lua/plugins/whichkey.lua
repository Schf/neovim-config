return {
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local whichkey = require("which-key")
			whichkey.setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})

			whichkey.register({
				["<leader>"] = {
					l = { name = "LSP" },
					s = { name = "Telescope" },
					r = { name = "Search and Replace" },
					m = { name = "Harpoon" },
					g = { name = "Git" },
				}
			})
		end,
	}
}
