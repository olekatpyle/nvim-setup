local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = true,
  layouts = {
    {

      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = 0.5, -- These can be integers or a float between 0 and 1.
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  },
})

vim.fn.sign_define(
  "DapBreakpoint",
  { text = "", texthl = "String", linehl = "", numhl = "" }
)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- DAP configurations

dap.configurations.java = {
  -- You need to extend the classPath to list your dependencies.
  -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
  classPaths = {},

  -- If using multi-module projects, remove otherwise.
  -- projectName = "yourProjectName",

  javaExec = "/usr/lib/jvm/java-17-openjdk/bin/java",
  mainClass = "App",

  -- If using the JDK9+ module system, this needs to be extended
  -- `nvim-jdtls` would automatically populate this property
  modulePaths = {},
  name = "Launch App",
  request = "launch",
  type = "java",
}

-- CSHARP Dap
dap.adapters.coreclr = {
  type = "executable",
  command = "/usr/local/netcoredbg",
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/")
    end,
  },
}
