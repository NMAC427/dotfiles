local M = {}

function M.autopairs()
  require("nvim-autopairs").setup {}

  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
end

function M.better_escape()
  require("better_escape").setup {
    mapping = { "jk" },
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
  }
end

function M.gitsigns()
  require("gitsigns").setup {}
end

function M.guess_indent()
  require("guess-indent").setup {}
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
      "nofile",
      "help",
    },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }
end

function M.treesitter()
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
end

return M
