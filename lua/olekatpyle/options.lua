local options = {
  backup = false, -- create a backup file
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  clipboard = "unnamedplus", -- allows nvim to access the system clipboard
  cmdheight = 1, -- more space in the nvim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- make `` visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hidden = true, -- required to keep multiple buffers and open multiple buffers
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search pattern
  mouse = "a", -- allow the mouse to be used in nvim
  pumheight = 10, -- pop up menu height
  showmode = false, -- display current mode
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smart again
  splitbelow = false, -- force all horizontal splits to go up current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- create a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 200, -- time to  wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  undodir = "$HOME/.config/nvim/undodir/",
  updatetime = 200, -- faster completion (4000ms default)
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 2, -- set number column width to 2 (default 4)
  signcolumn = "yes:4", -- always show the sign column, width=3
  colorcolumn = "80",
  wrap = false, -- toggle word wrap
  scrolloff = 999,
  spell = true,
}

vim.opt.shortmess:append("c")
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.o.ls = 0 --line height of last status
vim.o.ch = 0 -- line height of cmd
vim.cmd([[
  set undodir=$HOME/.config/nvim/undodir/               " set a path to a undo directory where the undo files will be placed

  set wildignore+=*.pyc
  set wildignore+=*.git
  set wildignore+=**/node_modules/*
  set whichwrap+=<,>,[,],h,l
  set laststatus=3
  set termguicolors
  set background=dark
  set guifont=Fira\ Code:h11.0

  ""set runtimepath+=~/.atpyle/dev/gith/xunit.nvim

  colorscheme noctis "gruvbox, onedark, noctis
  if exists("g:neovide")
    let g:neovide_refresh_rate = 60
    let g:neovide_refresh_rate_idle = 5
    let g:neovide_transparency = 1
    let g:neovide_cursor_vfx_mode = "pixiedust"
  endif

  " Lazygit globals
  let g:lazygit_floating_window_winblend = 0 " transparency of floating window
  let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
  let g:lazygit_floating_window_corner_chars = ['┌', '┐', '└', '┘'] " customize lazygit popup window corner characters
  let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
  let g:lazygit_use_neovim_remote = 0 " fallback to 0 if neovim-remote is not installed
]])
