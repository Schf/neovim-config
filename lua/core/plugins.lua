-- Function to install packer from github
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		print("Packer was not found. Currently installing it to:")
		print(install_path)
		print("\n")
		fn.system({ "git", "clone", "--depth", "1",
			"https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

Packer_bootstrap = ensure_packer()

if Packer_bootstrap then
	print("Instalation done. Press enter to begin installing plugins.")
	print("Remember to restart Neovim before doing any editing.")
	print("\n")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Use a protected call so we don't error out on first use
local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
	vim.notify("IMPORTANT - SOMETHING WENT WRONG WITH PACKER:", vim.log.levels.ERROR)
	vim.notify("" .. packer, vim.log.levels.ERROR)
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use { "wbthomason/packer.nvim" } -- Have packer manage itself

	require("conf.colorscheme")(use)
	require("conf.autocompletion")(use)
	require("conf.treesitter")(use)

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
	}
	use { "nvim-treesitter/playground" }
	-- use { "JoosepAlviste/nvim-ts-context-commentstring" }

	-- LSP
	use { "neovim/nvim-lspconfig" }
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	use { "mfussenegger/nvim-dap" }
	use { "jose-elias-alvarez/null-ls.nvim" }
	use { "RRethy/vim-illuminate" }

	-- Telescope
	use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }, }

	-- QoL
	use { "numToStr/Comment.nvim" }
	use { "L3MON4D3/LuaSnip" } -- Snippets engine
	use { "folke/which-key.nvim" }
	use { "ThePrimeagen/harpoon" }
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if Packer_bootstrap then
		packer.sync()
	end
end)
