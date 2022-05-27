local options = {
  backup = false,			                        -- create a backup file
  writebackup = false,			                    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  clipboard = "unnamedplus",		                -- allows nvim to access the system clipboard
  cmdheight = 1,			                        -- more space in the nvim command line for displaying messages
  completeopt = {"menuone", "noselect" },           -- mostly just for cmp
  conceallevel = 0,			                        -- make `` visible in markdown files
  fileencoding = "utf-8",		                    -- the encoding written to a file
  hidden = true,			                        -- required to keep multiple buffers and open multiple buffers
  hlsearch = true,			                        -- highlight all matches on previous search pattern
  ignorecase = true,			                    -- ignore case in search pattern
  mouse = "a",				                        -- allow the mouse to be used in nvim
  pumheight = 10,			                        -- pop up menu height
  showmode = false,			                        -- display current mode
  showtabline = 2,			                        -- always show tabs
  smartcase = true,			                        -- smart case
  smartindent = true,			                    -- make indenting smart again
  splitbelow = false,			                    -- force all horizontal splits to go up current window
  splitright = true,			                    -- force all vertical splits to go to the right of current window
  swapfile = false,		    	                    -- create a swapfile
  termguicolors = true,			                    -- set term gui colors (most terminals support this)
  timeoutlen = 200,			                        -- time to  wait for a mapped sequence to complete (in milliseconds)
  undofile = true,			                        -- enable persistent undo
  updatetime = 250, 			                    -- faster completion (4000ms default)
  expandtab = true,			                        -- convert tabs to spaces
  shiftwidth = 4,			                        -- the number of spaces inserted for each indentation
  tabstop = 4,				                        -- insert 2 spaces for a tab
  cursorline = true,			                    -- highlight the current line
  number = true,			                        -- set numbered lines
  relativenumber = true,		                    -- set relative numbered lines
  numberwidth = 2,			                        -- set number column width to 2 (default 4)
  signcolumn = "yes",			                    -- always show the sign column, otherwise it would shift the text each time
  colorcolumn = "80",
  wrap = false,                                     -- toggle word wrap
  scrolloff = 8,
}

vim.opt.shortmess:append "c"
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[ 
  set undodir=$HOME/.config/nvim/undodir/               " set a path to a undo directory where the undo files will be placed

  set wildignore+=*.pyc
  set wildignore+=*.git
  set wildignore+=**/node_modules/*
  set whichwrap+=<,>,[,],h,l

  set laststatus=3
  set termguicolors
  set background=dark
  
  let g:gruvbox_transparent_bg = 0 
  let g:gruvbox_contrast_dark = 1 
  let g:gruvbox_improved_strings = 0
  let g:gruvbox_improved_warinings = 0

  colorscheme gruvbox

  hi Normal guibg=NONE ctermbg=NONE                 " transparent background
  hi WinSeparator guibg='None' guifg='#c2a5f3'
  hi LspFloatWinNormal guibg='#282828' 
  hi LspFloatWinBorder guibg='#282828' 
  hi LspFloatWinBorder guibg='#282828'
  hi LspFloatWinBorder guifg='#c2a5f3'
  hi LspSagaHoverBorder guibg='#282828'
  hi LspSagaHoverBorder guifg='#c2a5f3'
  hi LspSagaDefPreviewBorder guibg='#282828'
  hi LspSagaDefPreviewBorder guifg='#c2a5f3'
  hi LspRenameBorder guibg='#282828'
  hi LspRenameBorder guifg='#c2a5f3'
  hi Menu guibg='#282828'  
  hi PMenu guibg='#282828'  
  hi PmenuSbar guibg='#c2a5f3'
  hi DiagnosticSignError guibg='#3c3836' guifg=Red
  hi DiagnosticSignWarn guibg='#3c3836' guifg=Orange 
  hi DiagnosticSignInfo guibg='#3c3836' guifg=LightBlue 
  hi DiagnosticSignHint guibg='#3c3836' guifg=LightGrey 
  hi NvimTreeNormal guibg='#282828' guifg=White
  hi NVimTreeFolderName guifg='#ffffff'
  hi NVimTreeOpenedFolderName guifg='#ebdbb2'
  hi NvimTreeOpenedFile guifg='#3de5a7' 
  hi TelescopeNormal guibg='#282828' guifg='#ffffff'
  hi TelescopeBorder guibg='#282828' guifg='#c2a5f3'
  hi NvimTreeIndentMarker guifg='#c2a5f3'
  hi NvimTreeWinSeparator guibg='#282828' guifg='#c2a5f3'

]])
