local navic = require("nvim-navic")
local wk = require("which-key")
local aerial = require("aerial")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "solid",
})

--- @return fun() @function that calls the provided fn, but with no args
local function w(fn)
	return function()
		return fn()
	end
end

local function buf_autocmd_codelens(bufnr)
	local group = vim.api.nvim_create_augroup("lsp_document_codelens", {})
	vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
		buffer = bufnr,
		group = group,
		callback = w(vim.lsp.codelens.refresh),
	})
end

-- Finds and runs the closest codelens (searches upwards only)
local function find_and_run_codelens()
	local bufnr = vim.api.nvim_get_current_buf()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local lenses = vim.lsp.codelens.get(bufnr)

	lenses = vim.tbl_filter(function(lense)
		return lense.range.start.line < row
	end, lenses)

	if #lenses == 0 then
		return vim.api.nvim_echo({ { "Could not find codelens to run.", "WarningMsg" } }, false, {})
	end

	table.sort(lenses, function(a, b)
		return a.range.start.line > b.range.start.line
	end)

	vim.api.nvim_win_set_cursor(0, { lenses[1].range.start.line + 1, lenses[1].range.start.character })
	vim.lsp.codelens.run()
	vim.api.nvim_win_set_cursor(0, { row, col }) -- restore cursor, TODO: also restore position
end

local function lsp_highlight_document(client)
	if client.server_capabilities.document_highlight then
		local status_ok, illuminate = pcall(require, "illuminate")
		if not status_ok then
			return
		end
		illuminate.on_attach(client)
	end
end

---@param bufnr number
local function lsp_signature_help(bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = {
			border = "single",
		},
	}, bufnr)
end

---@param bufnr number
local function buf_set_keymaps(bufnr)
	wk.register({
		g = {
			name = "LSP",
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
		},
	})
	map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true, noremap = true })
end

return function(client, bufnr)
	buf_set_keymaps(bufnr)
	lsp_highlight_document(client)
	lsp_signature_help(bufnr)
	navic.attach(client, bufnr)
	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
	end

	-- if client.supports_method("textDocument/codeLens") then
	-- 	buf_autocmd_codelens(bufnr)
	-- 	vim.schedule(vim.lsp.codelens.refresh)
	-- end

	if client.supports_method("textDocument/documentSymbol") then
		navic.attach(client, bufnr)
	end

	aerial.on_attach(client, bufnr)
end
