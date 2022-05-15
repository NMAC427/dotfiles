local present, toggleterm = pcall(require, "toggleterm")
if not present then
  return
end

local M = {}

function M.setup()
  toggleterm.setup {
    open_mapping = "<c-\\>\\",
    direction = "float",
    insert_mappings = false,
  }

  M.setup_lazygit()
end

-- Custom terminals
local Terminal = require("toggleterm.terminal").Terminal

function M.setup_lazygit()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    hidden = true,
  })

  vim.api.nvim_create_user_command("LazyGit", function (_)
    lazygit:toggle()
  end, {})
end

return M
