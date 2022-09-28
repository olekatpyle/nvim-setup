require("onedark").setup({
	-- Main options --
	-- style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	transparent = false, -- Show/hide background
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

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
		FloatBorder = { fg = "#3a3a3a", bg = "#1b1c1e" },
		Visual = { bg = "#f0f571" },

		Pmenu = { bg = "#1b1c1e" },
		PmenuSel = { fg = "#ffffff", bg = "#009966", fmt = "bold" },

		CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
		CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
		CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },

		CmpItemKindField = { fg = "#EED8DA", bg = "NONE" },
		CmpItemKindProperty = { fg = "#EED8DA", bg = "NONE" },
		CmpItemKindEvent = { fg = "#EED8DA", bg = "NONE" },

		CmpItemKindText = { fg = "#C3E88D", bg = "NONE" },
		CmpItemKindEnum = { fg = "#C3E88D", bg = "NONE" },
		CmpItemKindKeyword = { fg = "#C3E88D", bg = "NONE" },

		CmpItemKindConstant = { fg = "#FFE082", bg = "NONE" },
		CmpItemKindConstructor = { fg = "#FFE082", bg = "NONE" },
		CmpItemKindReference = { fg = "#FFE082", bg = "NONE" },

		CmpItemKindFunction = { fg = "#EADFF0", bg = "NONE" },
		CmpItemKindStruct = { fg = "#EADFF0", bg = "NONE" },
		CmpItemKindClass = { fg = "#EADFF0", bg = "NONE" },
		CmpItemKindModule = { fg = "#EADFF0", bg = "NONE" },
		CmpItemKindOperator = { fg = "#EADFF0", bg = "NONE" },

		CmpItemKindVariable = { fg = "#C5CDD9", bg = "NONE" },
		CmpItemKindFile = { fg = "#C5CDD9", bg = "NONE" },

		CmpItemKindUnit = { fg = "#F5EBD9", bg = "NONE" },
		CmpItemKindSnippet = { fg = "#F5EBD9", bg = "NONE" },
		CmpItemKindFolder = { fg = "#F5EBD9", bg = "NONE" },

		CmpItemKindMethod = { fg = "#DDE5F5", bg = "NONE" },
		CmpItemKindValue = { fg = "#DDE5F5", bg = "NONE" },
		CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "NONE" },

		CmpItemKindInterface = { fg = "#D8EEEB", bg = "NONE" },
		CmpItemKindColor = { fg = "#D8EEEB", bg = "NONE" },
		CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "NONE" },

		TelescopeBorder = { fg = "#3a3a3a", bg = "#1b1c1e" },
		TelescopePreviewBorder = { fg = "#3a3a3a", bg = "#1b1c1e" },
		TelescopePromptBorder = { fg = "#3a3a3a", bg = "#1b1c1e" },
		TelescopeResultsBorder = { fg = "#3a3a3a", bg = "#1b1c1e" },
		TelescopeNormal = { bg = "#1b1c1e" },

		MarkSignHL = { fg = "#ffffff", fmt = "bold" },
		MarkSignNumHL = { fg = "#8fb573", bg = "#232326", fmt = "bold" },
		MarkVirtTextHL = { fg = "#ffffff", fmt = "italic,bold" },

		IlluminatedWordText = { fmt = "bold" },
		IlluminatedWordRead = { fmt = "bold" },
		IlluminatedWordWrite = { fmt = "bold" },

		debugBreakpoint = { bg = "#de5d68", fg = "#232326" },

		CursorLine = { bg = "#282828" },
		ColorColumn = { bg = "#282828" },
		LineNr = { fg = "#8fb573" },
		CursorLineNr = { bg = "#282828", fg = "#f0f571" },

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
