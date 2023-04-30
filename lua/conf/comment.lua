local comment_status_ok, comment = pcall(require, "Comment")
if not comment_status_ok then
	vim.notify("Something went wrong with comment", vim.log.levels.WARN)
	-- vim.notify("" .. comment, vim.log.levels.DEBUG)
	return
end

comment.setup()
