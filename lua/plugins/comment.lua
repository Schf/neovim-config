return {
	{
		"numToStr/Comment.nvim",
		config = function()
			local comment = require("Comment")
			local huge_mod_str = "ts_context_commentstring.integrations.comment_nvim"
			local pre_hook = require(huge_mod_str).create_pre_hook()
			comment.setup({ pre_hook = pre_hook })
		end
	},
}
