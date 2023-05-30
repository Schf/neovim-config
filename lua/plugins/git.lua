return {
	{
		"tpope/vim-fugitive",
		config = function()
			Map("n", "<leader>gf", vim.cmd.Git, "Git Fugitive")
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
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "▎",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn"
					},
					delete = {
						hl = "GitSignsDelete",
						text = "契",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn"
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "契",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn"
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "▎",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn"
					},
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000,
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = {
					enable = false,
				},
			})

			local pref = "<leader>g"
			Map("n", pref .. "b", "<cmd>Telescope git_branches<cr>", "Checkout branch")
			Map("n", pref .. "c", "<cmd>Telescope git_commits<cr>", "Checkout commit")
			Map("n", pref .. "d", "<cmd>Gitsigns diffthis HEAD<cr>", "Diff")
			Map("n", pref .. "j", gitsigns.next_hunk, "Next Hunk")
			Map("n", pref .. "k", gitsigns.prev_hunk, "Prev Hunk")
			Map("n", pref .. "l", gitsigns.blame_line, "Blame")
			Map("n", pref .. "o", "<cmd>Telescope git_status<cr>", "Open changed file")
			Map("n", pref .. "p", gitsigns.preview_hunk, "Preview Hunk")
			Map("n", pref .. "r", gitsigns.reset_hunk, "Reset Hunk")
			Map("n", pref .. "R", gitsigns.reset_buffer, "Reset Buffer")
			Map("n", pref .. "s", gitsigns.stage_hunk, "Stage Hunk")
			Map("n", pref .. "u", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
		end,
	},
}
