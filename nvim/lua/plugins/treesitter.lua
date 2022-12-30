return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
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
          disable = {},
        },
      }
    end,
    enabled = require("config").plugins.enable.treesitter,
  },
}
