local nrmap = { noremap = true, silent = true }
local rmap = { silent = true }

local term_nrmap = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Space as leader
keymap("", "<Space>", "<Nop>", nrmap)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal mode = "n"
--   insert mode = "i"
--   visual mode = "v"
--   visual block mode = "x"
--   terminal mode = "t"
--   command mode = "c"

-- Normal
-- Better window navigation
keymap("n", "<C-k", "<C-w>k", nrmap)
keymap("n", "<C-j", "<C-w>j", nrmap)
keymap("n", "<C-h", "<C-w>h", nrmap)
keymap("n", "<C-l", "<C-w>l", nrmap)

-- Window resizing
keymap("n", "<C-Up>", ":resize +1<cr>", nrmap)
keymap("n", "<C-Down>", ":resize -1<cr>", nrmap)
keymap("n", "<C-Left>", ":vertical resize -1<cr>", nrmap)
keymap("n", "<C-Right>", ":vertical resize +1<cr>", nrmap)

-- Better buffer navigation
keymap("n", "<S-k>", ":BufferLineCycleNext<cr>", nrmap)
keymap("n", "<S-j>", ":BufferLineCyclePrev<cr>", nrmap)

-- Move buffers
keymap("n", "<M-K>", ":BufferLineMoveNext<CR>", nrmap)
keymap("n", "<M-J>", ":BufferLineMovePrev<CR>", nrmap)

-- Move text up and down
keymap("n", "<M-k>", ":m .-2<CR>", nrmap)
keymap("n", "<M-j>", ":m .+1<CR>", nrmap)

-- Left split Explorer
keymap("n", "<leader>e", ":Lex 40<cr>", nrmap)

-- Control save and quit
keymap("n", "<C-s>", ":w<cr>", nrmap)
keymap("n", "<C-q>", ":q<cr>", nrmap)

-- Empty line commands
keymap("n", "<leader>o", ":call append(line('.'), repeat([''], v:count1))<CR>", nrmap)
keymap("n", "<leader>O", ":call append(line('.')-1, repeat([''], v:count1))<CR>", nrmap)


-- Insert
keymap("i", "<C-s>", "<ESC>:w<CR>i", nrmap)
keymap("i", "<C-q>", "<ESC>:q<CR>i", nrmap)

-- Visual
-- Stay in "indent mode"
keymap("v", "<", "<gv", nrmap)
keymap("v", ">", ">gv", nrmap)

-- Move text up and down
keymap("v", "<M-k>", ":m .-2<cr>==", nrmap)
keymap("v", "<M-j>", ":m .+1<cr>==", nrmap)

-- Keep copied text after paste
keymap("n", "p", '"_dP', nrmap)


-- Visual Block
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", nrmap)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", nrmap)

