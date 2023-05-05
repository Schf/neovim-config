vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/bin/python"
-- netrw options
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.netrw_liststyle = 3

vim.o.background = "light"
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 2
vim.o.fileencoding = "utf-8"
vim.o.numberwidth = 4
vim.o.pumheight = 10
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 1000
vim.o.undofile = true
vim.o.updatetime = 300
vim.o.wrap = true
-- tab
vim.o.expandtab = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- line numbering
vim.o.number = true
vim.o.relativenumber = true
-- scroll
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.opt.iskeyword:append "-"
vim.opt.shortmess:append "c"
