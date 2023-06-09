return {
	{
		"tpope/vim-fugitive",
		config = function()
			Map("n", "<leader>gs", vim.cmd.Git, "Git Fugitive")
			local group = vim.api.nvim_create_augroup(
				"CustomFugitive", { clear = true }
			)
			vim.api.nvim_create_autocmd("BufEnter", {
				desc = "Adds <leader>gp as a keymap to \"git push\" inside Fugitive",
				pattern = "fugitive://*//",
				callback = function()
					local wk = require("which-key")
					wk.register({ ["<leader>gp"] = "Git Push" })
					Map("n", "<leader>gp", "<cmd>Git push<cr>", "Git Push")
				end,
				group = group,
			})
			vim.api.nvim_create_autocmd("BufLeave", {
				desc = "Removes <leader>gp as a keymap to \"git push\" "
					.. "when leaving Fugitive",
				pattern = "fugitive://*//",
				callback = function()
					local wk = require("which-key")
					wk.register({ ["<leader>gp"] = "which_key_ignore" })
					vim.keymap.del("n", "<leader>gp")
				end,
				group = group,
			})
		end,
	}
}
