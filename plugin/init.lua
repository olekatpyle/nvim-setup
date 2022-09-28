local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Installation

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Nvim ..")
	vim.cmd([[packadd packer.nvim]])
end

-- Sync

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

--------
-- Setup

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	----------
	-- Plugins

	-----
	-- UI
	-----
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
	})
	use({
		"dhruvmanila/telescope-bookmarks.nvim",
		tag = "*",
		requires = "kkharji/sqlite.lua",
	})

	use({
		"olekatpyle/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"kdheepak/tabline.nvim",
		requires = {
			{ "olekatpyle/lualine.nvim", opt = true },
			{ "kyazdani42/nvim-web-devicons", opt = true },
		},
	})

	--use("edkolev/tmuxline.vim")
	use({ "olekatpyle/tmuxline.vim", branch = "custom-seperator" })

	use("norcalli/nvim-colorizer.lua")

	----------
	-- Utility
	----------
	use("mbbill/undotree")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")

	use("Yggdroot/indentLine")
	use("lukas-reineke/indent-blankline.nvim")
	use("jiangmiao/auto-pairs")
	use("tpope/vim-commentary")
	use("folke/which-key.nvim")
	use("ThePrimeagen/harpoon")
	use({ "akinsho/toggleterm.nvim", tag = "v2.*" })
	use("jbyuki/venn.nvim")
	use("chentoast/marks.nvim")
	use("kdheepak/lazygit.nvim")
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})
	-- use("glepnir/dashboard-nvim")
	use("rcarriga/nvim-notify")

	use("olekatpyle/xunit.nvim")

	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")
	------
	-- LSP
	------
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	-- use("williamboman/nvim-lsp-installer")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("saadparwaiz1/cmp_luasnip")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	})
	use("olekatpyle/lspsaga.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")

	use("mfussenegger/nvim-jdtls")
	use("RRethy/vim-illuminate")
	use("ray-x/lsp_signature.nvim")

	-- Themes
	use("morhetz/gruvbox")
	use("navarasu/onedark.nvim")
	-- use("folke/tokyonight.nvim")
	-- use("Shatur/neovim-ayu")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
