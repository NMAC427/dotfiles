local cmd = vim.cmd
local o_s = vim.o
local map_key = vim.api.nvim_set_keymap


local function map(modes, lhs, rhs, opts)
  opts = opts or {}
  
  if opts.noremap == nil then opts.noremap = true end
  if type(modes) == 'string' then modes = {modes} end
  
  for _, mode in ipairs(modes) do
    map_key(mode, lhs, rhs, opts)
  end
end

return {
  map = map,
}
