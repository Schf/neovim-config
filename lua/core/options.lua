local g = vim.g
g.python_host_prog = "/usr/bin/python"
g.python3_host_prog = "/usr/bin/python"

local o = vim.opt
o.clipboard = "unnamedplus"
o.cmdheight = 2
o.fileencoding = "utf-8"
o.pumheight = 10
o.smartcase = true
o.smartindent = true
o.termguicolors = true
o.undofile = true
o.updatetime = 300
o.wrap = true
-- tab
o.expandtab = false
o.shiftwidth = 4
o.tabstop = 4
-- line numbering
o.number = true
o.relativenumber = false
-- scroll
o.scrolloff = 8
o.sidescrolloff = 8

o.iskeyword:append "-"
o.shortmess:append "c"
