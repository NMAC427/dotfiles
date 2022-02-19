-- Bootstrap Packer (in case it hasn't been installed yet)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Automatically recompile packer
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Plugins configuration
return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'          -- Packer can manage itself
  use 'dstein64/vim-startuptime'        -- Measure Startup Time
  use {                                 -- Faster Loading                  IN THE FUTURE, REPLACE WITH NVIM NATIVE IMPLEMENTATION: https://github.com/neovim/neovim/pull/16600
    'nathom/filetype.nvim',
    config = "require('config.filetype')"
  }
  use 'lewis6991/impatient.nvim'        -- Improve Startup Time

  -- Plugin Development
  -- use { '~/repos/guess-indent.nvim', config = function() require('guess-indent').setup() end }
  -- use 'nvim-lua/plenary.nvim'

  -- Color Schemes
  use 'joshdick/onedark.vim'            -- Color scheme
  use 'olimorris/onedarkpro.nvim'       -- Color scheme
  use 'jeffkreeftmeijer/vim-dim'        -- Color scheme - 16-colors

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer


  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = "require('config.lualine')",
  }

  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = "require('config.bufferline')",
  }

  -- Indentation style detection
  use {
    'NMAC427/guess-indent.nvim',
    config = function () require("guess-indent").setup { auto_cmd = false } end
  }

  -- better escape: Maps 'jk' in insert mode to <ESC>
  use {
    'max397574/better-escape.nvim',
    config = "require('config.better-escape')",
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = "require('config.telescope')",
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
