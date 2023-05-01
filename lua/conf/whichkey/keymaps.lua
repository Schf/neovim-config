local M = {}

M.opts = {
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

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

	["L"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover" },

	g = {
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP Goto Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP Goto Declaration" },
		I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP Goto Implementation" },
		l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "LSP Open Float" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP Goto References" },
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

		-- g = {
		-- 	name = "Git",
		-- 	g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		-- 	j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		-- 	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		-- 	l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		-- 	p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		-- 	r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		-- 	R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		-- 	s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		-- 	u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
		-- 	o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		-- 	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		-- 	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		-- 	d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
		-- },

		l = {
			name = "LSP",
			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics", },
			w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics", },
			f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
			i = { "<cmd>LspInfo<cr>", "Info" },
			I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
			j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
			k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
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
