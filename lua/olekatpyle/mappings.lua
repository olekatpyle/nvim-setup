local wk = require("which-key")

-- wrapper function
function map(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Leader
map("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

-- save and quit
map("n", "<Leader>w", ":w<CR>", { silent = true, noremap = true })
map("n", "<Leader>qq", ":q<CR>", { silent = true, noremap = true })
map("n", "<Leader>Q", ":q!<CR>", { silent = true, noremap = true })
map("n", "<Leader>q", ":bd<CR>", { silent = true, noremap = true })
map("n", "<Leader>s", "<cmd>so%<CR>", { silent = true, noremap = true })

-- basic window movement
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- indenting in visual mode
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- <ESC> alternative
map("i", "jk", "<ESC>", { noremap = true, silent = true })
map("i", "kj", "<ESC>", { noremap = true, silent = true })
map("i", "KJ", "<ESC>", { noremap = true, silent = true })
map("i", "JK", "<ESC>", { noremap = true, silent = true })

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
-- map("x", "K", ":move '<-2<CR>gv-gv'", { noremap = true, silent = true })
-- map("x", "J", ":move '>+1<CR>gv-gv'", { noremap = true, silent = true })

----------
-- PLUGINS

-- NeoTree explorer
map("n", "<Leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- LazyGit
map("n", "<Leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
wk.register(
  {
    g = {
      name = "Git",
      o = { ":DiffviewOpen<CR>", "Open Diffview" },
      k = { ":DiffviewClose<CR>", "Close Diffview" },
    },
  },
  {
    mode = "n",
    prefix = "<Leader>",
    buffer = nil,
    silent = true,
    nowait = false,
  }
)

-- Undotree
map("n", "<Leader>u", ":UndotreeToggle<CR>", { noremap = true })

-- Nvim Terminal
map(
  "n",
  "<Leader>t",
  ':lua NTGlobal["terminal"]:toggle()<CR>',
  { noremap = true, silent = true }
)

-- Telescope

local function search_nvim()
  require("telescope.builtin").find_files({
    prompt_title = "< .config/nvim >",
    cwd = vim.env.NVIM_DIR,
    hidden = true,
  })
end

local function search_qtile()
  require("telescope.builtin").find_files({
    prompt_title = "< Qtile >",
    cwd = vim.env.QT_DIR,
    hidden = true,
  })
end

local function search_devops()
  require("telescope.builtin").find_files({
    prompt_title = "< DevOps >",
    cwd = vim.env.DEVOPS_DIR,
    hidden = true,
  })
end

local function search_config()
  require("telescope.builtin").find_files({
    prompt_title = "< Config >",
    cwd = vim.env.CONF_DIR,
    hidden = true,
  })
end

local function search_www()
  require("telescope.builtin").find_files({
    prompt_title = "< www >",
    cwd = vim.env.WWW_DIR,
    hidden = true,
  })
end
wk.register(
  {
    p = {
      name = "Telescope",
      s = {
        ':lua require("telescope.builtin").grep_string({prompt_title = "Find string", grep_open_files = true})<CR>',
        "Grep String",
      },
      f = {
        ':lua require("telescope.builtin").find_files()<CR>',
        "Search file",
      },
      v = { search_nvim, "Search NVIM dir" },
      q = { search_qtile, "Search Qtile dir" },
      d = { search_devops, "Search DevOps dir" },
      c = { search_config, "Search .config dir" },
      w = { search_www, "Search www dir" },
      b = {
        ':lua require("telescope").extensions.bookmarks.bookmarks(opts)<CR>',
        "Search Firefox bookmarks",
      },
      e = {
        ':lua require("telescope").extensions.file_browser.file_browser(opts)<CR>',
        "File Browser",
      },
      h = { ':lua require("telescope.builtin").help_tags()<CR>', "Help tags" },
    },
  },
  {
    mode = "n",
    prefix = "<Leader>",
    buffer = nil,
    silent = true,
    nowait = false,
  }
)

-- Harpooning
wk.register({
  h = {
    name = "Harpoon",
    h = {
      ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
      "Toggle menu",
    },
    t = { ":Telescope harpoon marks<CR>", "Grep from Telescope" },
    i = { ':lua require("harpoon.mark").add_file()<CR>', "Add file" },
    n = { ':lua require("harpoon.ui").nav_next()<CR>', "Navigate to next" },
    p = {
      ':lua require("harpoon.ui").nav_prev()<CR>',
      "Navigate to previous",
    },
    f = { ':lua require("harpoon.ui").nav_file(1)<CR>', "Navigate to mark 1" },
    d = { ':lua require("harpoon.ui").nav_file(2)<CR>', "Navigate to mark 2" },
    s = { ':lua require("harpoon.ui").nav_file(3)<CR>', "Navigate to mark 3" },
    a = { ':lua require("harpoon.ui").nav_file(4)<CR>', "Navigate to mark 4" },
    c = {
      ':lua require("harpoon.tmux").sendCommand("term", vim.fn.input(">>> "))<CR>',
      "Fire command",
    },
    q = {
      ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>',
      "Toggle cmd menu",
    },
  },
}, { mode = "n", prefix = "<Leader>" })

-- Nvim Tree
wk.register({
  e = {
    name = "Nvim Tree",
    r = { ":NvimTreeRefresh <CR>", "Refresh tree" },
  },
}, { prefix = "<Leader>" })

wk.register({
  t = {
    name = "Nvim Terminal",
    j = { ':lua NTGlobal["window"]:change_height(2)<CR>', "Grow height" },
    k = { ':lua NTGlobal["window"]:change_height(-2)<CR>', "Shrink height" },
  },
}, { prefix = "<Leader>" })

-- Java
wk.register({
  j = {
    name = "Java",
    o = {
      "<Cmd>lua require'jdtls'.organize_imports()<CR>",
      "Organize Imports",
    },
    v = {
      "<Cmd>lua require('jdtls').extract_variable()<CR>",
      "Extract Variable",
    },
    c = {
      "<Cmd>lua require('jdtls').extract_constant()<CR>",
      "Extract Constant",
    },
    t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
    T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
    u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
  },
}, { mode = "n", prefix = "<Leader>", nowait = true, noremap = true })

wk.register({
  j = {
    name = "Java",
    v = {
      "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
      "Extract Variable",
    },
    c = {
      "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
      "Extract Constant",
    },
    m = {
      "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
      "Extract Method",
    },
  },
}, { mode = "v", prefix = "<Leader>", nowait = true, noremap = true })

-- Debugger
wk.register({
  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    B = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<CR>",
      "Conditional breakpoint",
    },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },
}, { mode = "n", prefix = "<Leader>" })

-- Xunit
wk.register({
  x = {
    name = "Xunit",
    l = { ":XToggleTests<CR>", "Open tests view" },
    n = { ":XNextTest<CR>", "Jump next test" },
    p = { ":XPrevTest<CR>", "Jump prev test" },
    x = { ":XRunTest<CR>", "Run selected test" },
    k = { ":XToggleLog<CR>", "Show test results" },
    a = { ":XRunAll<CR>", "Run all tests in buffer" },
  },
}, { mode = "n", prefix = "<Leader>" })
