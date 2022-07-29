------
-- Toggleterm configuration
-- Source: https://github.com/akinsho/toggleterm.nvim
------

require("toggleterm").setup({
	size = 15,
	hide_numbers = true,
	-- highlights = {
	-- 	Normal = {
	-- 		guibg = '#282828'
	-- 	},
	-- 	NormalFloat = {
	-- 		guibg = '#282828'
	-- 	},
	-- 	FloatBorder = {
	-- 		guibg = '#282828'
	-- 	},
	-- },
	open_mapping = [[<Leader>t]],
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = false, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	direction = "horizontal", --'vertical' | 'horizontal' | 'tab' | 'float',
	close_on_exit = false, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		--border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		--width = <value>,
		--height = <value>,
		--winblend = 3,
	},
})
