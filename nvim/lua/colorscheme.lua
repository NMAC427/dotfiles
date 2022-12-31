-- Set dark background
vim.g.background = "dark"

-- Check if terminal supports truecolor
if os.getenv("COLORTERM") == "truecolor" then
  local od_present, onedarkpro = pcall(require, "onedarkpro")
  if od_present then
    onedarkpro.load()
    return
  end
end

-- fall back to 256 colors theme
vim.g.onedark_terminal_italics = 1
if not pcall(vim.cmd, [[silent colorscheme onedark]]) then
  -- If this fails, fall back to a builtin theme
  vim.cmd([[silent colorscheme habamax]])
end
