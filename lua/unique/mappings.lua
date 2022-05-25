local M = {}

-- wrapper function
function map(mode, lhs, rhs, opts)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Leader
map("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- basic window movement
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- indenting in visual mode
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- <ESC> alternative
map("i", "jk", "<ESC>", { noremap = true, silent = true })
map("i", "jj", "<ESC>", { noremap = true, silent = true })
map("i", "kj", "<ESC>", { noremap = true, silent = true })
map("i", "KJ", "<ESC>", { noremap = true, silent = true })
map("i", "JK", "<ESC>", { noremap = true, silent = true })

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv'", { noremap = true, silent = true })
map("x", "J", ":move '>+1<CR>gv-gv'", { noremap = true, silent = true })

----------
-- PLUGINS

-- NvimTree explorer
map("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Undotree
map("n", "<Leader>u", ":UndotreeToggle<CR>", { noremap = true })

-- Nvim Terminal
map("n", "<Leader>t", ':lua NTGlobal["terminal"]:toggle()<CR>', { noremap = true, silent = true })

-- Telescope
local wk = require("which-key")
wk.register({
	p = {
		name = "Telescope",
		s = {
			':lua require("telescope.builtin").grep_string {search = vim.fn.input("  for: ")}<CR>',
			"Grep String",
		},
		f = { ':lua require("telescope.builtin").find_files()<CR>', "Search file" },
		v = { ':lua require("unique.telescope").search_nvim()<CR>', "Search NVIM dir" },
		g = { ':lua require("telescope.builtin").git_files()<CR>', "Git files" },
		q = { ':lua require("unique.telescope").search_qtile()<CR>', "Search Qtile dir" },
	},
}, { mode = "n", prefix = "<Leader>", buffer = nil, silent = true, nowait = false })

-- Harpooning
wk.register({
	h = {
		name = "Harpoon",
		h = { ':lua require("harpoon.ui").toggle_quick_menu()<CR>', "Toggle menu" },
		t = { ":Telescope harpoon marks<CR>", "Grep from Telescope" },
		i = { ':lua require("harpoon.mark").add_file()<CR>', "Add file" },
		n = { ':lua require("harpoon.ui").nav_next()<CR>', "Navigate to next" },
		p = { ':lua require("harpoon.ui").nav_prev()<CR>', "Navigate to previous" },
		f = { ':lua require("harpoon.ui").nav_file(1)<CR>', "Navigate to mark 1" },
		d = { ':lua require("harpoon.ui").nav_file(2)<CR>', "Navigate to mark 2" },
		s = { ':lua require("harpoon.ui").nav_file(3)<CR>', "Navigate to mark 3" },
		a = { ':lua require("harpoon.ui").nav_file(4)<CR>', "Navigate to mark 4" },
		c = { ':lua require("harpoon.tmux").sendCommand("term", vim.fn.input(">>> "))<CR>', "Fire command" },
		q = { ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', "Toggle cmd menu" },
	},
}, { mode = "n", prefix = "<Leader>" })

-- Nvim Tree
wk.register({
	e = {
		name = "Nvim Tree",
		r = { ":NvimTreeRefresh <CR>", "Refresh tree" },
	},
}, { prefix = "<Leader>" })

wk.register({
	t = {
		name = "Nvim Terminal",
		j = { ':lua NTGlobal["window"]:change_height(2)<CR>', "Grow height" },
		k = { ':lua NTGlobal["window"]:change_height(-2)<CR>', "Shrink height" },
	},
}, { prefix = "<Leader>" })

-- Java
wk.register({
    j = {
        name = "Java",
        o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
        v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
        c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
        t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
        T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
        u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
    }
}, {mode='n', prefix='<Leader>', nowait=true, noremap=true })

wk.register({
    j = {
        name = "Java",
        v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
        c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
        m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
    },
}, {mode='v', prefix='<Leader>', nowait=true, noremap=true})


-- Debugger
wk.register({
      d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },
}, {mode='n', prefix='<Leader>'})


-- LSP keymaps
function M.lsp_keymaps(bufnr)
	wk.register({
		g = {
			name = "LSP",
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			d = { "<cmd>Lspsaga preview_definition<CR>", "Preview definition" },
			D = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Lookup definition in buffer" },
			I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Lookup implementation" },
			s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signature help" },
			r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Lookup references" },
			h = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "LSP finder" },
			l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagnostics" },
			k = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", "Scroll up saga" },
			j = { "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", "Scroll down saga" },
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
			-- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
			--vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
		},
	}, { buffer = bufnr })

	wk.register({
		["<Leader>"] = {
			name = "LSP",
			ca = { "<cmd>Lspsaga code_action<CR>", "Code actions" },
			rn = { "<cmd>Lspsaga rename<CR>", "Rename" },
			K = { "<cmd>Lspsaga hover_doc<CR>", "Hover documentation" },
		},
	})

	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])
end

return M
