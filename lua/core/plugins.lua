	-- Function to install packer from github
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		print("Packer was not found. Currently installing it to:")
		print(install_path)
		print("\n")
		fn.system({"git", "clone", "--depth", "1",
				"https://github.com/wbthomason/packer.nvim", install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

packer_bootstrap = ensure_packer()

if packer_bootstrap then
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
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("IMPORTANT - SOMETHING WENT WRONG WITH PACKER:", packer)
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

	use { "nvim-lua/plenary.nvim" } -- Common dependance

	use { "catppuccin/nvim" }
	-- use { "EdenEast/nightfox.nvim" }

	-- Autocompletion
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-cmdline" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "saadparwaiz1/cmp_luasnip" } -- Snippet completions

	-- Snippets
	use { "L3MON4D3/LuaSnip" } -- Snippets engine

	-- LSP
	use { "neovim/nvim-lspconfig" }
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	use { "mfussenegger/nvim-dap" }
	use { "jose-elias-alvarez/null-ls.nvim" }
	use { "RRethy/vim-illuminate" }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		packer.sync()
	end
end)

