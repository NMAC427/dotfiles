local M = {}

function M.better_escape()
  require("better_escape").setup {
    mapping = { "jk" },
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
  }
end

function M.indent_blankline()
  require("indent_blankline").setup {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "nvchad_cheatsheet",
      "lsp-installer",
      "",
    },
    buftype_exclude = {
      "terminal",
      "help",
    },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }
end

function M.guess_indent()
  require("guess-indent").setup {
  }
end

function M.treesitter()
  require("nvim-treesitter.configs").setup {
    ensure_installed = "maintained",
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
end

function M.toggleterm()
  require("toggleterm").setup {
    open_mapping = "<c-\\>\\",
    direction = "float",
    insert_mappings = false,
  }
end

return M
