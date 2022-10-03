------
-- Toggleterm configuration
-- Source: https://github.com/akinsho/toggleterm.nvim
------
local bg = "#0c0c0c"
require("toggleterm").setup({
  size = 13,
  hide_numbers = true,
  highlights = {
    Normal = {
      guibg = "#0c0c0c",
    },
    NormalFloat = {
      guibg = "#0c0c0c",
    },
    FloatBorder = {
      guibg = "#0c0c0c",
    },
    SignColumn = {
      guibg = "#0c0c0c",
    },
    WinSeperator = {
      guibg = "#0c0c0c",
    },
  },
  open_mapping = [[<Leader>t]],
  shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = "horizontal", --'vertical' | 'horizontal' | 'tab' | 'float',
  close_on_exit = false, -- close the terminal window when the process exits
  autochdir = true,
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = "shadow",
    --width = <value>,
    --height = <value>,
    --winblend = 3,
  },
})
