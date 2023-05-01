local nrmap = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--	 normal mode = "n"
--	 insert mode = "i"
--	 visual mode = "v"
--	 visual block mode = "x"
--	 terminal mode = "t"
--	 command mode = "c"

-- Normal
-- Better window navigation
keymap("n", "<C-k>", "<C-w>k", nrmap)
keymap("n", "<C-j>", "<C-w>j", nrmap)
keymap("n", "<C-h>", "<C-w>h", nrmap)
keymap("n", "<C-l>", "<C-w>l", nrmap)

-- Window resizing
keymap("n", "<C-Up>", ":resize +1<cr>", nrmap)
keymap("n", "<C-Down>", ":resize -1<cr>", nrmap)
keymap("n", "<C-Left>", ":vertical resize -1<cr>", nrmap)
keymap("n", "<C-Right>", ":vertical resize +1<cr>", nrmap)

-- Better buffer navigation
keymap("n", "<S-k>", ":bnext<cr>", nrmap)
keymap("n", "<S-j>", ":bprevious<cr>", nrmap)
keymap("n", "<leader>q", ":bd<cr>", nrmap)

-- Keep cursor on middle during on half-page scrolling
keymap("n", "<C-u>", "<C-u>zz", nrmap)
keymap("n", "<C-d>", "<C-d>zz", nrmap)

-- Open Netrw
keymap("n", "<leader>e", ":Ex<cr>", nrmap)

-- Control save and quit
keymap("n", "<C-s>", ":w<cr>", nrmap)
keymap("n", "<C-q>", ":q<cr>", nrmap)

-- Empty line commands
keymap("n", "<leader>o", ":call append(line('.'), repeat([''], v:count1))<CR>", nrmap)
keymap("n", "<leader>O", ":call append(line('.')-1, repeat([''], v:count1))<CR>", nrmap)


-- Insert
keymap("i", "<C-s>", "<ESC>:w<CR>a", nrmap)
keymap("i", "<C-q>", "<ESC>:q<CR>a", nrmap)
