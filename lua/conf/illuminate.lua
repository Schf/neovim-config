local cmp_status_ok, illuminate = pcall(require, "illuminate")
if not cmp_status_ok then
	vim.notify("Something went wrong with illuminate", vim.log.levels.WARN)
	-- vim.notify("" .. illuminate, vim.log.levels.DEBUG)
	return
end

illuminate.configure({
	delay = 0,
})
