local M = {}

M.setup = function()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
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

local function lsp_signature_help(bufnr)
	require("lsp_signature").on_attach({
		bind = true,
		handler_opts = {
			border = "single",
		},
	}, bufnr)
end

M.on_attach = function(client, bufnr, attach_opts)
	require("olekatpyle.mappings").lsp_keymaps(bufnr)
	lsp_highlight_document(client)
	lsp_signature_help(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
