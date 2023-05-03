local plugins = {
	require("conf.autocompletion.cmp"),
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip",
	require("conf.autocompletion.autopairs"),
}

return function(use)
	for _, plugin in pairs(plugins) do
		use(plugin)
	end
end
