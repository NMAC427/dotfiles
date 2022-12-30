local M = {
  "akinsho/toggleterm.nvim",
  enabled = require("config").plugins.enable.toggleterm,
}

function M.config()
  require("toggleterm").setup {
    open_mapping = "<c-\\>\\",
    direction = "float",
    insert_mappings = false,
  }

  -- Custom Terminals

  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new {
    cmd = "lazygit",
    dir = "git_dir",
    hidden = true,
  }

  vim.api.nvim_create_user_command("LazyGit", function(_)
    lazygit:toggle()
  end, {})
end

return M
