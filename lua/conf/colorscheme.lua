local main = {
	"catppuccin/nvim",
	config = function()
		local colorscheme_status_ok, colorscheme_module = pcall(require, "catppuccin")
		if not colorscheme_status_ok then
			vim.notify("Something went wrong with the colorscheme", vim.log.levels.WARN)
			-- vim.notify("" .. colorscheme_module, vim.log.levels.DEBUG)
			return
		end

		colorscheme_module.setup({})
		vim.cmd("colorscheme " .. "catppuccin-latte")
	end
}

return function(use)
	use(main)
end
