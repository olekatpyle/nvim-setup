local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettierd,
		-- formatting.stylelint,
		formatting.rustfmt,
		formatting.stylua,
		--formatting.autopep8,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.clang_format,
		formatting.cmake_format.with({ filetypes = { "Makefile", "MAKEFILE", "makefile", "make" } }),
		formatting.trim_whitespace.with({ args = { '{sub(/[ \t ]+$/, ""); print}' } }),
		diagnostics.flake8,
		diagnostics.checkmake.with({ filetypes = { "Makefile", "MAKEFILE", "makefile", "make" } }),
		diagnostics.eslint,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
