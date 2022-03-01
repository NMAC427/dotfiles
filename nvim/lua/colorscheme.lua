local cmd = vim.cmd

-- Set dark background
vim.g.background = "dark"

-- Check if terminal supports truecolor
if os.getenv("COLORTERM") == "truecolor" then
  local onedarkpro = require("onedarkpro")

  onedarkpro.setup {
    colors = {},
    plugins = {
      all = false,
      native_lsp = true,
      packer = true,
      nvim_cmp = true,
      telescope = true,
    },
    styles = {
      comments = "italic",
    },
    options = {
      italic = true,
      cursorline = true,
    },

    hlgroups = {
      TabLine = { bg = "${bg_statusline}" },
      TabLineSel = { bg = "${highlight}", fg = "${black}", style = "bold" },
      TabLineFill = { bg = "${bg_statusline}" },
    },
  }

  onedarkpro.load()
else
  -- Fall back to theme that supports 256 colors
  vim.g.onedark_terminal_italics = 1
  cmd([[colorscheme onedark]])
end
