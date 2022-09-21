local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("olekatpyle.lsp.lsp-signature")
require("olekatpyle.lsp.lsp-installer")
require("olekatpyle.lsp.handlers").setup()
require("olekatpyle.lsp.null-ls")
require("olekatpyle.lsp.lspsaga")
require("olekatpyle.lsp.dap")
