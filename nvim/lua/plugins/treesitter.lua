return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      -- Enable folding
      vim.opt.foldlevel = 99
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false

      -- Configure TS
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "bash",
          "c",
          "css",
          "cpp",
          "dockerfile",
          "html",
          "javascript",
          "json",
          "kotlin",
          "latex",
          "lua",
          "make",
          "markdown",
          "python",
          "vim",
          "zig",
        },
        sync_install = false,
        highlight = {
          enable = true,
          disable = {},
          use_languagetree = true,
        },
        indent = {
          enable = true,
          disable = {
            "html",
          },
        },
      }
    end,
    enabled = require("config").plugins.enable.treesitter,
  },

  {
    "windwp/nvim-ts-autotag",
    config = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
