local function has_local_plugin(path)
  local e_path = vim.fn.expand(path)
  if vim.fn.isdirectory(e_path) == 1 then
    return e_path
  end
  return nil
end

local config = require("config").plugins

return {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",

  {
    "NMAC427/guess-indent.nvim",
    dir = has_local_plugin("~/repos/guess-indent.nvim/"),
    event = "BufReadPre",
    cmd = "GuessIndent",
    config = {},
    enabled = require("config").plugins.enable.toggleterm,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = {
      mapping = { "jk" },
      timeout = vim.o.timeoutlen,
      clear_empty_lines = false,
      keys = "<Esc>",
    },
    enabled = config.enable.better_escape,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = {},
    enabled = config.enable.comment,
  },

  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").set_default_keymaps()
    end,
  },

  {
    "windwp/nvim-spectre",
    cmd = "Spectre",
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
  },

  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },

  -- Color Schemes

  {
    "olimorris/onedarkpro.nvim",
    config = {
      styles = {
        comments = "italic",
      },
      options = {
        italic = true,
        cursorline = true,
      },
      highlights = {
        TabLine = { bg = "${bg_statusline}" },
        TabLineSel = { bg = "${highlight}", fg = "${black}", style = "bold" },
        TabLineFill = { bg = "${bg_statusline}" },
      },
    },
    cond = function()
      return os.getenv("COLORTERM") == "truecolor"
    end,
  },

  {
    "joshdick/onedark.vim",
    cond = function()
      return os.getenv("COLORTERM") ~= "truecolor"
    end,
  },

  -- File Types

  "bfontaine/Brewfile.vim",
  "mtikekar/vim-bsv",
}
