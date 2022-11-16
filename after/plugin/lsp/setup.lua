local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local util = require("lspconfig.util")
local cmp_lsp = require("cmp_nvim_lsp")
local home = os.getenv("HOME")
local jdtls = require("jdtls")
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local function create_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  vim.list_extend(
    capabilities.textDocument.completion.completionItem.resolveSupport.properties,
    {
      "documentation",
      "detail",
      "additionalTextEdits",
    }
  )
  return cmp_lsp.update_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
  if config.on_attach then
    config.on_attach = util.add_hook_after(
      config.on_attach,
      require("olekatpyle.lsp.on_attach")
    )
  else
    config.on_attach = require("olekatpyle.lsp.on_attach")
  end
  config.capabilities = vim.tbl_deep_extend(
    "force",
    create_capabilities(),
    config.capabilities or {}
  )
end)

require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "omnisharp",
    "pyright",
    "rust_analyzer",
    "jdtls",
    "tsserver",
  },
})
require("mason-lspconfig").setup_handlers({
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup({
      -- library = { plugins = { "neotest" }, types = true },
      settings = {
        Lua = {
          format = {
            enable = false,
          },
          hint = {
            enable = true,
            arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
            await = true,
            paramName = "Disable", -- "All", "Literal", "Disable"
            paramType = false,
            semicolon = "Disable", -- "All", "SameLine", "Disable"
            setType = true,
          },
          diagnostics = {
            globals = { "P", "vim", "use" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
  ["omnisharp"] = function()
    lspconfig.omnisharp.setup({
      filetypes = { "cs" },
      init_options = {
        AutomaticWorkspaceInit = true,
      },
    })
  end,
  ["tsserver"] = function()
    lspconfig.tsserver.setup({
      settings = {
        compilerOptions = {
          module = "commonjs",
          target = "es6",
          checkJs = "false",
        },
        exclude = { "node_modules" },
        filetypes = { "*.tsx", "*.ts", "*.jsx", "*.js", "*.astro" },
      },
    })
  end,
  ["pyright"] = function()
    lspconfig.pyright.setup({
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "on",
            useLibraryCodeForTypes = true,
            autoSearchPaths = true,
          },
        },
      },
    })
  end,
  ["rust_analyzer"] = function()
    lspconfig.rust_analyzer.setup({})
  end,
  ["jdtls"] = function()
    local function progress_handler()
      ---@type table<string, boolean>
      local tokens = {}
      ---@type table<string, boolean>
      local ready_projects = {}
      ---@param result {type:"Starting"|"Started"|"ServiceReady", message:string}
      return function(_, result, ctx)
        local cwd = vim.loop.cwd()
        if ready_projects[cwd] then
          return
        end
        local token = tokens[cwd] or vim.tbl_count(tokens)
        if result.type == "Starting" and not tokens[cwd] then
          tokens[cwd] = token
          vim.lsp.handlers["$/progress"](nil, {
            token = token,
            value = {
              kind = "begin",
              title = "jdtls",
              message = result.message,
              percentage = 0,
            },
          }, ctx)
        elseif result.type == "Starting" then
          local _, percentage_index = string.find(result.message, "^%d%d?%d?")
          local percentage = 0
          local message = result.message
          if percentage_index then
            percentage = tonumber(
              string.sub(result.message, 1, percentage_index)
            )
            message = string.sub(result.message, percentage_index + 3)
          end

          vim.lsp.handlers["$/progress"](nil, {
            token = token,
            value = {
              kind = "report",
              message = message,
              percentage = percentage,
            },
          }, ctx)
        elseif result.type == "Started" then
          vim.lsp.handlers["$/progress"](nil, {
            token = token,
            value = {
              kind = "report",
              message = result.message,
              percentage = 100,
            },
          }, ctx)
        elseif result.type == "ServiceReady" then
          ready_projects[cwd] = true
          vim.lsp.handlers["$/progress"](nil, {
            token = token,
            value = {
              kind = "end",
              message = result.message,
            },
          }, ctx)
        end
      end
    end

    lspconfig.jdtls.setup({
      use_lombok_agent = true,
      handlers = {
        ["language/status"] = progress_handler,
      },
      settings = {
        ["java.format.settings.url"] = home
          .. "/.atpyle/dev/gith/google-java-format/pom.xml",
        java = {
          contentProvider = { preferred = "fernflower" },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
            },
            filteredTypes = {
              "com.sun.*",
              "io.micrometer.shaded.*",
              "java.awt.*",
              "jdk.*",
              "sun.*",
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          eclipse = {
            downloadSources = true,
          },
          configuration = {
            updateBuildConfiguration = "interactive",
            runtimes = {
              {
                name = "JavaSE-11",
                path = "/usr/lib/jvm/java-11-openjdk/",
              },
              {
                name = "JavaSE-17",
                path = "/usr/lib/jvm/java-17-openjdk/",
              },
              {
                name = "JavaSE-18",
                path = "/usr/lib/jvm/java-18-openjdk/",
              },
            },
          },
          maven = {
            downloadSources = true,
          },
          --	implementationsCodeLens = {
          --		enabled = true,
          --	},
          referencesCodeLens = {
            enabled = true,
          },
          --	references = {
          --		includeDecompiledSources = true,
          --	},
          format = {
            enabled = true,
            -- settings = {
            --   profile = "asdf"
            -- }
          },
          project = {
            referencedLibraries = {
              vim.fn.glob(
                home .. "/.local/share/jars/javafx/javafx-sdk-18.0.1/lib/*.jar"
              ),
            },
          },
        },
        signatureHelp = { enabled = true },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
          },
        },
        --contentProvider = { preferred = "fernflower" },
        extendedClientCapabilities = extendedClientCapabilities,
        --sources = {
        --	organizeImports = {
        --		starThreshold = 9999,
        --		staticStarThreshold = 9999,
        --	},
        --},
        --codeGeneration = {
        --	toString = {
        --		template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        --	},
        --	useBlocks = true,
        --},
        --},

        flags = {
          allow_incremental_sync = true,
        },

        ---- Language server `initializationOptions`
        ---- You need to extend the `bundles` with paths to jar files
        ---- if you want to use additional eclipse.jdt.ls plugins.
        ----
        ---- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
        ----
        ---- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
        --init_options = {
        ---- bundles = {},
        --bundles = {},
      },
    })
  end,
})
