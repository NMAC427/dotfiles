local cmd = vim.cmd

-- Set dark background
vim.g.background = "dark"

-- Check if terminal supports truecolor
local od_present, onedarkpro = pcall(require, "onedarkpro")
if os.getenv("COLORTERM") == "truecolor" and od_present then

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
  cmd([[silent! colorscheme onedark]])
end
