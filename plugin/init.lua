local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- Installation

if fn.empty(fn.glob(install_path)) > 0 then
   packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
   print 'Installing packer close and reopen Nvim ..'
   vim.cmd [[packadd packer.nvim]]
end

-- Sync

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Setup

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Plugins
    -- UI
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons'
      }
    }

    use { 'nvim-telescope/telescope.nvim',
      requires = {
          { 'nvim-lua/plenary.nvim' },
          { 'nvim-lua/popup.nvim' },
          { 'nvim-telescope/telescope-fzy-native.nvim' }
      }
    }

    use 'ryanoasis/vim-devicons'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'edkolev/tmuxline.vim'


    -- Utility
    use 'mbbill/undotree'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-emoji'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
    use 'williamboman/nvim-lsp-installer'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'saadparwaiz1/cmp_luasnip'
    use {'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp'}

    use 'olekatpyle/lspsaga.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    use 'mfussenegger/nvim-dap'
    use {'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'}}

    use 'mfussenegger/nvim-jdtls'

    use 'Yggdroot/indentLine'

    use 'jiangmiao/auto-pairs'

    use 'tpope/vim-fugitive'

    use 'tpope/vim-commentary'

    use 'folke/which-key.nvim'

    use 'ThePrimeagen/harpoon'

    use {'akinsho/toggleterm.nvim', tag='v1.*'}

    use 'jbyuki/venn.nvim'

    -- Themes
    use 'morhetz/gruvbox'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
