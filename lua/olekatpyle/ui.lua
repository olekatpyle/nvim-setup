-- color scheme used for lualine
--
-- lightblue     = '#cacfd2',
-- white         = '#ffffff',
-- gray_0        = '#3a3a3a',
-- gray_1        = '#282828',
-- rose          = '#ce537a',
-- pink          = '#ff5faf',
-- purple        = '#d75fff',
-- darkpurple    = '#875faf',
-- aqua      = '#009966',
-- yellow        = '#f0f571',

vim.cmd([[
  set laststatus=3
  set termguicolors
  set background=dark
  
  let g:gruvbox_transparent_bg = 1 
  let g:gruvbox_contrast_dark = 'hard' 
  let g:gruvbox_italicize_comments = 1
  let g:gruvbox_italic = 1 
  let g:gruvbox_italicize_strings = 1
  let g:gruvbox_improved_strings = 0
  let g:gruvbox_improved_warinings = 0

  colorscheme gruvbox

  " hi Normal guibg=NONE ctermbg=NONE                 " transparent background
  hi Comment guifg='#93939c'
  hi LineNr guifg=#7c6f64 guibg=#3c3836
  hi WinSeparator guibg='None' guifg='#282828'
  hi LspFloatWinNormal guibg='#282828' 
  hi LspFloatWinBorder guibg='#282828' guifg='#3c3836'
  hi LspSagaHoverBorder guibg='#282828' guifg='#3c3836'
  hi LspSagaDefPreviewBorder guibg='#282828'
  hi LspSagaDefPreviewBorder guifg='#c2a5f3'
  hi LspRenameBorder guibg='#282828' guifg='#3c3836'
  hi Menu guibg='#282828'  
  hi PMenu guibg='#282828'  
  hi PmenuSbar guibg='#c2a5f3'
  hi DiagnosticSignError guibg='#3c3836' guifg=Red
  hi DiagnosticSignWarn guibg='#3c3836' guifg=Orange 
  hi DiagnosticSignInfo guibg='#3c3836' guifg=LightBlue 
  hi DiagnosticSignHint guibg='#3c3836' guifg=LightGrey 
  hi DiagnosticUnderlineError cterm=undercurl gui=undercurl
  hi DiagnosticUnderlineWarn cterm=undercurl gui=undercurl
  hi DiagnosticUnderlineInfo cterm=undercurl gui=undercurl
  hi DiagnosticUnderlineHint cterm=undercurl gui=undercurl
  " hi NvimTreeNormal guibg='#282828' guifg=White
  " hi NVimTreeFolderName guifg='#ffffff'
  " hi NVimTreeOpenedFolderName guifg='#98971a' gui='bold'
  " hi NvimTreeOpenedFile guifg='#b8bb26' gui='bold' 
  " hi NvimTreeIndentMarker guifg='#fbf1c7'
  " hi NvimTreeWinSeparator guibg='#282828' guifg='#3c3836'
  " hi NvimTreeFolderIcon guifg=#ffffff
  hi TelescopeNormal guibg='#282828' guifg='#ffffff'
  hi TelescopeBorder guibg='#282828' guifg='#3c3836'
  hi MarkSignHL guifg=#ffffff guibg=#3c3836
  hi ErrorMsg guifg=Red guibg=NONE
]])
