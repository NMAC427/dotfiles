-- PLUGINS

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

  use 'wbthomason/packer.nvim'		-- Packer can manage itself
  use 'nathom/filetype.nvim'		-- Faster Loading                  IN THE FUTURE, REPLACE WITH NVIM NATIVE IMPLEMENTATION: https://github.com/neovim/neovim/pull/16600
  use 'joshdick/onedark.vim'		-- Color scheme
  use 'itchyny/lightline.vim'		-- Fancy status line

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = [[ require('config.telescope') ]],
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
