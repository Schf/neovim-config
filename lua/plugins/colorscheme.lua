return {
	"catppuccin/nvim",
	config = function()
		vim.o.background = "light"
		vim.cmd.colorscheme("catppuccin-latte")
	end,
}
