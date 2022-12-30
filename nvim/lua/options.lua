local opt = vim.opt
local config = require("config")

-- Load options
for name, value in pairs(config.options) do
  opt[name] = value
end

-- MISC OPTIONS --
local misc = config.misc

vim.g.mapleader = misc.mapleader
vim.g.maplocalleader = misc.maplocalleader

-- Set language to en_US
vim.cmd([[ language messages en_US.UTF-8 ]])

-- Set python provider to speed up loading
vim.g.loaded_python_provider = 1
-- vim.g.python3_host_prog = vim.env.HOME .. "/.venvs/nvim/bin/python3"

--Defer loading shada until after startup
local shadafile = vim.opt.shadafile
vim.opt.shadafile = "NONE"
vim.schedule(function()
  vim.opt.shadafile = shadafile
  vim.cmd([[ silent! rsh ]])
end)
