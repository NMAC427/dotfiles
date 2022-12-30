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

    highlights = {
      TabLine = { bg = "${bg_statusline}" },
      TabLineSel = { bg = "${highlight}", fg = "${black}", style = "bold" },
      TabLineFill = { bg = "${bg_statusline}" },
    },
  }

  onedarkpro.load()
  return
end

-- fall back to 256 colors theme
vim.g.onedark_terminal_italics = 1
if not pcall(vim.cmd, [[silent colorscheme onedark]]) then
  -- If this fails, fall back to a builtin theme
  vim.cmd([[silent colorscheme habamax]])
end
