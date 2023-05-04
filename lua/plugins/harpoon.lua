return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function ()
			local ui = require("harpoon.ui")
			local mark = require("harpoon.mark")
			local pref = "<leader>l"
			Map("n", pref .. " ", mark.add_file, "Harpoon Add Mark")
	
			Map("n", pref .. "m", ui.toggle_quick_menu, "Harpoon Toggle Menu")
			Map("n", pref .. "k", ui.nav_next, "Harpoon Go to Next Mark")
			Map("n", pref .. "j", ui.nav_next, "Harpoon Go to Prev Mark")
	
			local nav_file = function(num)
				return function()
					ui.nav_file(num)
				end
			end
			Map("n", pref .. "q", nav_file(1), "Hapoon Go to 1st Mark")
			Map("n", pref .. "w", nav_file(2), "Hapoon Go to 2nd Mark")
			Map("n", pref .. "e", nav_file(3), "Hapoon Go to 3rd Mark")
			Map("n", pref .. "r", nav_file(4), "Hapoon Go to 4th Mark")
			Map("n", pref .. "a", nav_file(5), "Hapoon Go to 5th Mark")
			Map("n", pref .. "s", nav_file(6), "Hapoon Go to 6th Mark")
			Map("n", pref .. "d", nav_file(7), "Hapoon Go to 6th Mark")
			Map("n", pref .. "f", nav_file(8), "Hapoon Go to 6th Mark")
		end,
	},
}
