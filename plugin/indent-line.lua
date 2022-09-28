vim.cmd([[
  let g:indentLine_setColors = 1
  let g:indentLine_char = ''
  let g:indentLine_fileTypeExclude = ['dashboard']
]])

require("indent_blankline").setup({
	-- for example, context is off by default, use this to turn it on
	show_current_context = false,
	show_current_context_start = false,
})
