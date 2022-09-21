local status_ok, installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
	"astro",
	"sumneko_lua",
	"pyright",
	"clangd",
	-- "omnisharp",
	"csharp_ls",
	"tsserver",
	"cssls",
	"tailwindcss",
}

local settings = {
	ensure_installed = servers,
	-- automatic_installation = false,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},

	log_level = vim.log.levels.INFO,
	-- max_concurrent_installers = 4
	-- install_root_dir = "lsp_servers",
}

installer.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("olekatpyle.lsp.handlers").on_attach,
		capabilities = require("olekatpyle.lsp.handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("olekatpyle.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("olekatpyle.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = require("olekatpyle.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "csharp_ls" then
		local sharp_opts = require("olekatpyle.lsp.settings.omnisharp")
		opts = vim.tbl_deep_extend("force", sharp_opts, opts)
	end

	if server == "astro" then
		local astro_opts = require("olekatpyle.lsp.settings.astro")
		opts = vim.tbl_deep_extend("force", astro_opts, opts)
	end

	lspconfig[server].setup(opts)
end
