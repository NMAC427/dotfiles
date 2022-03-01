local present, filetype = pcall(require, "filetype")
if not present then
  return
end

local M = {}

function M.setup()
  filetype.setup {
    overrides = {
      extensions = {
        plist = "xml",
      },
    },
  }
end

return M
