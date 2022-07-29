require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox_dark",
		-- theme = "neo_violet",
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				colored = true,
				diff_color = {
					added = { guibg = "#875faf", guifg = "#009966" },
					modified = { guibg = "#875faf", guifg = "#f0f571" },
					removed = { guibg = "#875faf", guifg = "#ce537a" },
				},
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
			{
				"diagnostics",
				-- diagnostics_color = {
				--     error = {guibg='#875faf', guifg='#ce537a'},
				--     warn = {guibg='#875faf', guifg='#f0f571'},
				--     info = {guibg='#875faf', guifg='#cacfd2'},
				--     hint = {guibg='#875faf', guifg='#009966'},
				-- }
			},
		},
		lualine_c = {
			{
				"filetype",
				icon_only = true,
				separator = "",
				padding = { right = 0, left = 1 },
				"filename",
			},
			"filename",
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { require("tabline").tabline_buffers },
		lualine_x = { require("tabline").tabline_tabs },
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "nvim-tree", "toggleterm", "fzf", "fugitive" },
})

vim.cmd([[ 
    hi lualine_a_normal gui=italic
    hi lualine_a_insert gui=italic
    hi lualine_a_visual gui=italic
    hi lualine_a_command gui=italic
    hi lualine_a_replace gui=italic
    hi lualine_a_inactive gui=italic
]])
