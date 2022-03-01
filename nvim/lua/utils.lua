local M = {}

local cmd = vim.cmd

-- Helper function for easier key remapping
function M.map(modes, keys, command, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end

  if type(modes) ~= "table" then
    modes = { modes }
  end
  if type(keys) ~= "table" then
    keys = { keys }
  end

  for _, mode in ipairs(modes) do
    for _, key in ipairs(keys) do
      vim.api.nvim_set_keymap(mode, key, command, options)
    end
  end
end

-- Lazy load plugins
function M.packer_lazy_load(plugin, timer)
  if not plugin then
    return
  end

  timer = timer or 0
  vim.defer_fn(function()
    require("packer").loader(plugin)
  end, timer)
end

return M
