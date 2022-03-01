local utils = require("utils")

local map = utils.map
local cmd = vim.cmd

local M = {}

-- Essential mappings
function M.misc()
  -- Add Packer commands because we are not loading it at startup
  cmd("silent! command PackerClean lua require('plugins') require('packer').clean()")
  cmd("silent! command PackerCompile lua require('plugins') require('packer').compile()")
  cmd("silent! command PackerInstall lua require('plugins') require('packer').install()")
  cmd("silent! command PackerStatus lua require('plugins') require('packer').status()")
  cmd("silent! command PackerSync lua require('plugins') require('packer').sync()")
  cmd("silent! command PackerUpdate lua require('plugins') require('packer').update()")
end

function M.telescope()
  map("n", "<leader>fb", ":Telescope buffers <CR>")
  map("n", "<leader>ff", ":Telescope find_files <CR>")
  map("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
  map("n", "<leader>fh", ":Telescope help_tags <CR>")
  map("n", "<leader>fg", ":Telescope live_grep <CR>")
  map("n", "<leader>fo", ":Telescope oldfiles <CR>")
end

return M
