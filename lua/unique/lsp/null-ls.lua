local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with {
		--     extra_filetypes = {},
		--     extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		-- },
		formatting.stylua,
		--formatting.autopep8,
		formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.clang_format,
		-- formatting.cmake_format,
		-- formatting.djlint,
		-- formatting.eslint_d,
		-- formatting.fixjson,
		formatting.clang_format,
		formatting.cmake_format.with({ filetypes = { "Makefile", "MAKEFILE", "makefile", "make" } }),
		diagnostics.flake8,
		diagnostics.checkmake.with({ filetypes = { "Makefile", "MAKEFILE", "makefile", "make" } }),
	},
})
