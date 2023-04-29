local cmp_status_ok, illuminate = pcall(require, "illuminate")
if not cmp_status_ok then
	vim.notify("Something went wrong with illuminate: " .. illuminate)
	return
end
