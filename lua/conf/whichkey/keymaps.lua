local M = {}

M.opts = {
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

-- local gitsigns = require("gitsigns")

M.n = {
	["<C-k>"] = { "<C-w>k", "Go to Window Above" },
	["<C-j>"] = { "<C-w>j", "Go to Window Below" },
	["<C-h>"] = { "<C-w>h", "Go to Right Window" },
	["<C-l>"] = { "<C-w>l", "Go to Left Window" },

	["<C-Up>"] = { ":resize +1<cr>", "Resize Window Vertically Larger" },
	["<C-Down>"] = { ":resize -1<cr>", "Resize Window Vertically Smaller" },
	["<C-Left>"] = { ":vertical resize -1<cr>", "Resize Window Horizontally Smaller" },
	["<C-Right>"] = { ":vertical resize +1<cr>", "Resize Window Horizontally Larger" },

	["<S-k>"] = { ":bnext<cr>", "Next Buffer" },
	["<S-j>"] = { ":bprevious<cr>", "Previous Buffer" },

	["<C-u>"] = { "<C-u>zz", "Scroll Half-Page Up" },
	["<C-d>"] = { "<C-d>zz", "Scroll Half-Page Down" },

	["<C-s>"] = { ":w<cr>", "Save" },
	["<C-q>"] = { ":q<cr>", "Quit" },

	L = { vim.lsp.buf.hover, "LSP Hover" },

	g = {
		d = { vim.lsp.buf.definition, "LSP Goto Definition" },
		D = { vim.lsp.buf.declaration, "LSP Goto Declaration" },
		I = { vim.lsp.buf.implementation, "LSP Goto Implementation" },
		l = { vim.diagnostic.open_float, "LSP Open Float" },
		r = { vim.lsp.buf.references, "LSP Goto References" },
	},

	["<leader>"] = {
		q = { ":bd<cr>", "Close Buffer" },
		e = { ":Ex<cr>", "Open Netrw" },
		h = { "<cmd>nohlsearch<CR>", "No Highlight" },
		o = { ":call append(line('.'), repeat([''], v:count1))<CR>", "Create Line Below" },
		O = { ":call append(line('.')-1, repeat([''], v:count1))<CR>", "Create Line Above" },

		p = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		m = {
			name = "Mason",
			i = { "<cmd>MasonInstall<cr>", "Install" },
			l = { "<cmd>MasonLog<cr>", "Log" },
			m = { "<cmd>Mason<cr>", "Main Window" },
			u = { "<cmd>MasonUpdat<cr>", "Update" },
			x = { "<cmd>MasonUninstall<cr>", "Uninstall" },
			X = { "<cmd>MasonUninstallAll<cr>", "Uninstall ALL" },
		},

		s = {
			name = "Search",
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			C = { "<cmd>Telescope commands<cr>", "Command" },
			f = { "<cmd>Telescope find_files<cr>", "File" },
			g = { "<cmd>Telescope live_grep<cr>", "Text" },
			h = { "<cmd>Telescope help_tags<cr>", "Help" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymap" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Page" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Register" },
		},

		g = {
			name = "Git",
			-- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
			j = { require("gitsigns").next_hunk, "Next Hunk" },
			k = { require("gitsigns").prev_hunk, "Prev Hunk" },
			l = { require("gitsigns").blame_line, "Blame" },
			p = { require("gitsigns").preview_hunk, "Preview Hunk" },
			r = { require("gitsigns").reset_hunk, "Reset Hunk" },
			R = { require("gitsigns").reset_buffer, "Reset Buffer" },
			s = { require("gitsigns").stage_hunk, "Stage Hunk" },
			u = { require("gitsigns").undo_stage_hunk, "Undo Stage Hunk", },
			o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
			d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
		},

		l = {
			name = "LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics", },
			w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics", },
			f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
			j = { vim.diagnostic.goto_next, "Next Diagnostic", },
			k = { vim.diagnostic.goto_prev, "Prev Diagnostic", },
			l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
		},

		-- t = {
		-- 	name = "Terminal",
		-- 	n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		-- 	u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		-- 	t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		-- 	p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		-- 	f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		-- 	h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		-- 	v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
		-- },
	}
}

M.i = {
	["<C-l>"] = { vim.lsp.buf.hover, "LSP Hover" },

	["<C-s>"] = { "<ESC>:w<CR>a", "Save" },
	["<C-q>"] = { "<ESC>:q<CR>a", "Quit" },
}

M.v = {
	["<"] = { "<gv", "One More Indent" },
	[">"] = { ">gv", "One Less Indent" },

	["<M-k>"] = { ":move .-2<CR>gv-gv", "Move Line(s) Up" },
	["<M-j>"] = { ":move '>+1<CR>gv-gv", "Move Line(s) Down" },

	p = { '"_dP', "Paste Without Yank" },
}

return M
