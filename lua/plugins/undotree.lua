return {
	{
		"mbbill/undotree",
		config = function()
			Map("n", "<leader>u", vim.cmd.UndotreeToggle, "Toggle Undo Tree")
		end,
	},
}
