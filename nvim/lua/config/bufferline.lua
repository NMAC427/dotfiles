require("bufferline").setup {
  options = {
    close_command = "bdelete %d",
    right_mouse_command = "silent! bdelete %d",
    separator_style = "thin",
    enforce_regular_tabs = true
  }
}
