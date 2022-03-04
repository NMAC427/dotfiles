local M = {}

-- General nvim options, use `:h <option_name>` for more information
-- stylua: ignore start
M.options = {

  -- VISUAL --
  number = true,                    -- Show line numbers
  relativenumber = true,            -- Make line numbers relative
  signcolumn = "yes",               -- Always display the sign columin
  wrap = false,                     -- Wrap long lines
  linebreak = true,                 -- Wrap at word boundaries
  breakindent = true,               -- Indent wrapped lines
  scrolloff = 8,                    -- Keep cursor more centered
  sidescrolloff = 8,                -- Keep cursor more centered: horizontally
  showtabline = 2,                  -- Always show tabline
  colorcolumn = "80",               -- Highligh column 80
  tabstop = 4,                      -- Default width of a tab
  softtabstop = 4,                  -- How much the tab key indents
  shiftwidth = 4,                   -- Reindent operations width


  -- BEHAVIORAL --
  ignorecase = true,                -- Case insensitive search unless /C or capital in search.
  smartcase = true,                 -- Override ignorecase if the search pattern contains capitals.
  smartindent = true,               -- Smart indenting
  textwidth = 0,                   -- Wrap text at width when reflowing
  mouse = "a",                      -- Enable mouse support
  -- selectmode = "mouse"
  clipboard = "unnamedplus",        -- Enable OS clipboard sync
  whichwrap = "b,s,<,>,[,]",        -- Make arrow keys wrap at end of line
  undofile = true,                  -- Save edit history to disk
  swapfile = true,                  -- Enable swap file
  updatetime = 300,                 -- Faster completion


  -- GUI SPECIFIC --
  guifont = "SauceCodePro_Nerd_Font:h13",
  guifontwide = "SauceCodePro_Nerd_Font:h13",
}
-- stylua: ignore end

M.misc = {
  mapleader = " ",
}

-- PLUGIN OPTIONS --

M.plugins = {
  enable = {
    alpha = true,
    better_escape = true,
    bufferline = true,
    cmp = true,
    comment = true,
    guess_indent = true,
    indent_blankline = true,
    lsp = true,
    startuptime = true,
    toggleterm = true,
    treesitter = true,
  },
}

return M
