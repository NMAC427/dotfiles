local utils = require("utils")
local map = utils.map

local M = {}

-- Essential mappings
function M.misc()
  -- GENERAL --
  map({ "n", "v" }, "<Down>", "gj")
  map({ "n", "v" }, "<Up>", "gk")

  -- NORMAL MODE --
  -- Better Window Navigation
  map("n", "<C-h>", "<C-w>h")
  map("n", "<C-j>", "<C-w>j")
  map("n", "<C-k>", "<C-w>k")
  map("n", "<C-l>", "<C-w>l")

  -- Buffer Navigation
  map("n", "L", ":bnext<CR>")
  map("n", "H", ":bprevious<CR>")

  -- Swap Lines
  map("n", "<Leader>j", "<Esc>:m .+1<CR>==")
  map("n", "<Leader>k", "<Esc>:m .-2<CR>==")

  -- Clear Highlight
  map("n", "<Esc><Esc>", ":nohl<CR>")

  -- ToggleTerm
  map("n", "<leader>lg", ":LazyGit<CR>")

  -- INSERT MODE --

  -- VISUAL MODE --
  -- Swap Lines
  map("v", "<Leader>j", ":m '>+1<CR>gv=gv")
  map("v", "<Leader>k", ":m '<-2<CR>gv=gv")

  -- Better Indenting
  map("v", "<", "<gv")
  map("v", ">", ">gv")

  -- TERMINAL --
  map("t", "<C-\\><esc>", "<C-\\><C-N>")
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
