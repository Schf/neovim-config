vim.g.mapleader = " "
vim.g.maplocalleader = " "

Map = function(mode, lhs, rhs, desc, opts)
	opts = opts or { noremap = true, silent = true }
	opts = vim.tbl_deep_extend("force", { desc = desc }, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Modes
--	 normal mode = "n"
--	 insert mode = "i"
--	 visual mode = "v"
--	 visual block mode = "x"
--	 terminal mode = "t"
--	 command mode = "c"

-- Normal
-- Better window navigation
Map("n", "<C-k>", "<C-w>k", "Go to Window Above")
Map("n", "<C-j>", "<C-w>j", "Go to Window Below")
Map("n", "<C-h>", "<C-w>h", "Go to Left Window")
Map("n", "<C-l>", "<C-w>l", "Go to Right Window")

-- Window resizing
Map("n", "<C-Up>", ":resize +1<cr>", "Resize Window Taller")
Map("n", "<C-Down>", ":resize -1<cr>", "Resize Window Shorter")
Map("n", "<C-Left>", ":vertical resize -1<cr>", "Resize Window Thinner")
Map("n", "<C-Right>", ":vertical resize +1<cr>", "Resize Window Thicker")

-- Better buffer navigation
Map("n", "<S-k>", ":bnext<cr>", "Go to Next Buffer")
Map("n", "<S-j>", ":bprevious<cr>", "Go to Previous Buffer")
Map("n", "<leader>q", ":bd<cr>", "Close Buffer")

-- QoL
Map("n", "<leader>h", ":noh", "Remove Search Highlight")
Map("n", "<C-u>", "<C-u>zz", "Scroll Up Half-Page")
Map("n", "<C-d>", "<C-d>zz", "Scroll Down Half-Page")

-- Open Netrw
Map("n", "<leader>e", vim.cmd.Ex, "Open Netrw")

-- Control save and quit
Map("n", "<C-s>", ":w<cr>", "Save")
Map("n", "<C-q>", ":q<cr>", "Quit")

-- Empty line commands
Map(
	"n",
	"<leader>O",
	":call append(line('.')-1, repeat([''], v:count1))<CR>",
	"Add Line Above"
)
Map(
	"n",
	"<leader>o",
	":call append(line('.'), repeat([''], v:count1))<CR>",
	"Add Line Below"
)


-- Insert
Map("i", "<C-s>", "<ESC>:w<CR>a", "Save")
Map("i", "<C-q>", "<ESC>:q<CR>a", "Quit")


-- Visual
Map("v", "<", "<gv", "Remove Indent")
Map("v", ">", ">gv", "Add Indent")

Map("v", "<M-k>", ":move .-2<CR>gv-gv", "Move Line(s) Up")
Map("v", "<M-j>", ":move '>+1<CR>gv-gv", "Move Line(s) Down")

Map("v", "p", "\"_dP", "Paste Without Yank")
