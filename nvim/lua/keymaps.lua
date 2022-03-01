local map = require("utils").map

-- Set leader to spaces
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- INSERT MODE --

-- VISUAL MODE --
-- Swap Lines
map("v", "<Leader>j", ":m '>+1<CR>gv=gv")
map("v", "<Leader>k", ":m '<-2<CR>gv=gv")
