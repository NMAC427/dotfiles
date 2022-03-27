local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

local M = {}

function M.setup()
  bufferline.setup {
    options = {
      close_command = "bdelete %d",
      right_mouse_command = "silent! bdelete %d",
      separator_style = "thin",
      show_tab_indicators = true,
    },
  }
end

return M
