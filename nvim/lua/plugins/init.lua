local packer_bootstrap, packer = unpack(require("plugins.packerinit"))
local plugin_conf = require("config").plugins

-- Returns a path if it exists, else return fallback.
local function local_with_fallback(path, fallback)
  local e_path = vim.fn.expand(path)
  if vim.fn.isdirectory(e_path) == 1 then
    return e_path
  else
    return fallback
  end
end

local plugins = {
  ["lewis6991/impatient.nvim"] = {},
  ["nvim-lua/plenary.nvim"] = {},

  ["wbthomason/packer.nvim"] = {
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("plugins")
      end, 250)
    end,
  },

  ["kyazdani42/nvim-web-devicons"] = {
    event = "VimEnter",
  },

  ["nvim-lualine/lualine.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require("plugins.config.lualine").setup()
    end,
  },

  ["akinsho/bufferline.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require("plugins.config.bufferline").setup()
    end,
    disable = not plugin_conf.enable.bufferline,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    event = "BufRead",
    run = ":TSUpdate",
    config = function()
      require("plugins.config.other").treesitter()
    end,
    disable = not plugin_conf.enable.treesitter,
  },

  -- GIT
  ["lewis6991/gitsigns.nvim"] = {
    setup = function()
      require("utils").packer_lazy_load("gitsigns.nvim")
    end,
    config = function()
      require("plugins.config.other").gitsigns()
    end,
  },

  -- LSP
  ["neovim/nvim-lspconfig"] = {
    module = "lspconfig",
    opt = true,
    setup = function()
      require("utils").packer_lazy_load("nvim-lspconfig")
    end,
    config = function()
      require("lsp")
    end,
    disable = not plugin_conf.enable.lsp,
  },

  ["williamboman/nvim-lsp-installer"] = {
    opt = true,
    setup = function()
      require("utils").packer_lazy_load("nvim-lsp-installer")
    end,
    disable = not plugin_conf.enable.lsp,
  },

  -- cmp
  ["rafamadriz/friendly-snippets"] = {
    event = "InsertCharPre",
    disable = not plugin_conf.enable.cmp,
  },

  ["L3MON4D3/LuaSnip"] = {
    after = "friendly-snippets",
    wants = "friendly-snippets",
    config = function ()
      require("plugins.config.luasnip-rc")
    end,
    disable = not plugin_conf.enable.cmp,
  },

  ["hrsh7th/nvim-cmp"] = {
    after = "LuaSnip",
    config = function()
      require("plugins.config.cmp")
    end, -- TODO: make setup
    disable = not plugin_conf.enable.cmp,
  },

  ["hrsh7th/cmp-buffer"] = {
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  ["hrsh7th/cmp-path"] = {
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  ["f3fora/cmp-spell"] = {
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  ["hrsh7th/cmp-cmdline"] = {
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  ["saadparwaiz1/cmp_luasnip"] = {
    after = "nvim-cmp",
    wants = "LuaSnip",
    disable = not plugin_conf.enable.cmp,
  },

  ["hrsh7th/cmp-nvim-lua"] = {
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  ["hrsh7th/cmp-nvim-lsp"] = {
    module = "cmp_nvim_lsp",
    wants = "nvim-cmp",
    after = "nvim-cmp",
    disable = not (plugin_conf.enable.lsp and plugin_conf.enable.cmp),
  },

  -- misc plugins
  [local_with_fallback("~/repos/guess-indent.nvim", "NMAC427/guess-indent.nvim")] = {
    module = "guess-indent",
    event = "BufRead",
    config = function()
      require("plugins.config.other").guess_indent()
    end,
    disable = not plugin_conf.enable.guess_indent,
  },

  ["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
    config = function()
      require("plugins.config.other").autopairs()
    end,
    disable = not plugin_conf.enable.autopairs,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = function()
      require("plugins.config.other").indent_blankline()
    end,
    disable = not plugin_conf.enable.indent_blankline,
  },

  ["max397574/better-escape.nvim"] = {
    event = "InsertCharPre",
    config = function()
      require("plugins.config.other").better_escape()
    end,
    disable = not plugin_conf.enable.better_escape,
  },

  ["dstein64/vim-startuptime"] = {
    cmd = "StartupTime",
    disable = not plugin_conf.enable.startuptime,
  },

  ["numToStr/Comment.nvim"] = {
    module = "Comment",
    setup = function()
      require("utils").packer_lazy_load("Comment.nvim")
    end,
    config = function()
      require("Comment").setup()
    end,
    disable = not plugin_conf.enable.comment,
  },

  ["goolord/alpha-nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require("plugins/config/alpha").setup()
    end,
    disable = not plugin_conf.enable.alpha,
  },

  ["nvim-telescope/telescope.nvim"] = {
    module = "telescope",
    cmd = "Telescope",
    setup = function()
      require("mappings").telescope()
    end,
    config = function()
      require("plugins/config/telescope").setup()
    end,
  },

  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require("plugins/config/toggleterm").setup()
    end,
    disable = not plugin_conf.enable.toggleterm,
  },

  -- language plugins
  ["ziglang/zig.vim"] = {
    ft = "zig",
  },

  ["bfontaine/Brewfile.vim"] = {},

  -- TODO: Fix
  ["NvChad/nvim-colorizer.lua"] = {},

  -- TODO: Move
  ["joshdick/onedark.vim"] = {},
  ["olimorris/onedarkpro.nvim"] = {},
  ["jeffkreeftmeijer/vim-dim"] = {},

}

-- Modify plugins table so that the key is contained in the value at index 1
-- This is required for packer.
for key, v in pairs(plugins) do
  v[1] = key
end

return packer.startup(function(use)
  for _, v in pairs(plugins) do
    use(v)
  end

  if packer_bootstrap then
    packer.sync()
  end
end)
