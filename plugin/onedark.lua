require("onedark").setup({
	-- Main options --
	style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = true, -- reverse item kind highlights in cmp menu

	-- toggle theme style ---
	toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

	-- Change code style ---
	-- Options are italic, bold, underline, none
	-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	-- Custom Highlights --
	-- onedark bg    = '#232326'
	-- lightblue     = '#cacfd2',
	-- white         = '#ffffff',
	-- gray_0        = '#3a3a3a',
	-- gray_1        = '#282828',
	-- black_0       = '#1b1c1e'
	-- rose          = '#ce537a',
	-- pink          = '#ff5faf',
	-- purple        = '#d75fff',
	-- darkpurple    = '#875faf',
	-- aqua          = '#009966',
	-- green         = '#5fe268'
	-- yellow        = '#f0f571',
	colors = {}, -- Override default colors
	highlights = {
		NormalFloat = { bg = "#1b1c1e" },
		FloatBorder = { fg = "#ffffff", bg = "#1b1c1e" },
		TelescopeBorder = { fg = "#ffffff", bg = "#1b1c1e" },
		TelescopePreviewBorder = { fg = "#ffffff", bg = "#1b1c1e" },
		TelescopePromptBorder = { fg = "#ffffff", bg = "#1b1c1e" },
		TelescopeResultsBorder = { fg = "#ffffff", bg = "#1b1c1e" },
		TelescopeNormal = { bg = "#1b1c1e" },
		MarkSignHL = { fg = "#ffffff", fmt = "bold" },
		MarkSignNumHL = { fg = "#8fb573", bg = "#232326", fmt = "bold" },
		MarkVirtTextHL = { fg = "#ffffff", fmt = "italic,bold" },
		IlluminatedWordText = { bg = "#282828", fmt = "None" },
		IlluminatedWordRead = { fg = "#ffffff", fmt = "bold" },
		IlluminatedWordWrite = { fg = "#ffffff", fmt = "bold" },
		debugBreakpoint = { bg = "#de5d68", fg = "#232326" },
		CursorLine = { bg = "#282828" },
		ColorColumn = { bg = "#282828" },
		LineNr = { fg = "#8fb573" },
		CursorLineNr = { bg = "#2c2d30", fg = "#f0f571" },
		DashboardHeader = { fg = "#875faf", fmt = "bold" },
		XVirtNormal = { fmt = "italic,bold" },
		XVirtPassed = { fg = "#5fe268", fmt = "bold" },
		XVirtFailed = { fg = "#de5d68", fmt = "bold" },
	}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = false, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = false, -- use background color for virtual text
	},
})
require("onedark").load()
