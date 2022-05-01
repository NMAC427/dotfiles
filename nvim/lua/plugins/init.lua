local present, packer = pcall(require, "plugins.packerInit")
local plugin_conf = require("config").plugins

if not present then
  return false
end

local plugins = {
  { "lewis6991/impatient.nvim" },
  { "nvim-lua/plenary.nvim" },

  {
    "wbthomason/packer.nvim",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("plugins")
      end, 250)
    end,
  },

  {
    "kyazdani42/nvim-web-devicons",
    event = "VimEnter",
  },

  {
    "nvim-lualine/lualine.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plugins.config.lualine").setup()
    end,
  },

  {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plugins.config.bufferline").setup()
    end,
    disable = not plugin_conf.enable.bufferline,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
    config = function()
      require("plugins.config.other").treesitter()
    end,
    disable = not plugin_conf.enable.treesitter,
  },

  -- GIT
  {
    "lewis6991/gitsigns.nvim",
    setup = function()
      require("utils").packer_lazy_load("gitsigns.nvim")
    end,
    config = function()
      require("plugins.config.other").gitsigns()
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    opt = true,
    setup = function()
      -- Lazy load at startup
      vim.defer_fn(function()
        require("packer").loader("nvim-lspconfig")
        -- reload the current file so lsp actually starts for it
        vim.cmd('if &ft == "packer" | echo "" | else | silent! e %')
      end, 0)
    end,
    config = function()
      require("lsp")
    end,
    disable = not plugin_conf.enable.lsp,
  },

  {
    "williamboman/nvim-lsp-installer",
    opt = true,
    setup = function()
      require("utils").packer_lazy_load("nvim-lsp-installer")
    end,
    disable = not plugin_conf.enable.lsp,
  },

  -- cmp
  {
    "rafamadriz/friendly-snippets",
    event = "InsertCharPre",
    disable = not plugin_conf.enable.cmp,
  },

  {
    "L3MON4D3/LuaSnip",
    after = "friendly-snippets",
    wants = "friendly-snippets",
    disable = not plugin_conf.enable.cmp,
  },

  {
    "hrsh7th/nvim-cmp",
    after = "LuaSnip",
    config = function()
      require("plugins.config.cmp")
    end, -- TODO: make setup
    disable = not plugin_conf.enable.cmp,
  },

  {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  {
    "hrsh7th/cmp-path",
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  {
    "f3fora/cmp-spell",
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  {
    "hrsh7th/cmp-cmdline",
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  {
    "saadparwaiz1/cmp_luasnip",
    after = "nvim-cmp",
    wants = "LuaSnip",
    disable = not plugin_conf.enable.cmp,
  },

  {
    "hrsh7th/cmp-nvim-lua",
    after = "nvim-cmp",
    disable = not plugin_conf.enable.cmp,
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    module = "cmp_nvim_lsp",
    wants = "nvim-cmp",
    after = "nvim-cmp",
    disable = not (plugin_conf.enable.lsp and plugin_conf.enable.cmp),
  },

  -- misc plugins
  {
    "/Users/nicolas/repos/guess-indent.nvim",
    module = "guess-indent",
    event = "BufRead",
    config = function()
      require("plugins.config.other").guess_indent()
    end,
    disable = not plugin_conf.enable.guess_indent,
  },

  {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("plugins.config.other").autopairs()
    end,
    disable = not plugin_conf.enable.autopairs,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("plugins.config.other").indent_blankline()
    end,
    disable = not plugin_conf.enable.indent_blankline,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = function()
      require("plugins.config.other").better_escape()
    end,
    disable = not plugin_conf.enable.better_escape,
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    disable = not plugin_conf.enable.startuptime,
  },

  {
    "numToStr/Comment.nvim",
    module = "Comment",
    setup = function()
      require("utils").packer_lazy_load("Comment.nvim")
    end,
    config = function()
      require("Comment").setup()
    end,
    disable = not plugin_conf.enable.comment,
  },

  {
    "goolord/alpha-nvim",
    after = "nvim-web-devicons",
    config = function()
      require("plugins/config/alpha").setup()
    end,
    disable = not plugin_conf.enable.alpha,
  },

  {
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    setup = function()
      require("mappings").telescope()
    end,
    config = function()
      require("plugins/config/telescope").setup()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins/config/other").toggleterm()
    end,
    disable = not plugin_conf.enable.toggleterm,
  },

  -- TODO: Fix
  { "NvChad/nvim-colorizer.lua" },

  -- TODO: Move
  { "joshdick/onedark.vim" },
  { "olimorris/onedarkpro.nvim" },
  { "jeffkreeftmeijer/vim-dim" },
  -- { "yuttie/comfortable-motion.vim" },
}

return packer.startup(function(use)
  for _, v in ipairs(plugins) do
    use(v)
  end
end)
