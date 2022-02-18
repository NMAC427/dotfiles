-- local cmd = vim.cmd
-- local o_s = vim.o

-- Helper function for easier key remapping
local function keymap(modes, lhs, rhs, opts)
  opts = opts or {}

  if opts.noremap == nil then opts.noremap = true end
  if opts.silent == nil then opts.silent = true end
  if type(modes) == 'string' then modes = {modes} end

  for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

return {
  keymap = keymap,
}
