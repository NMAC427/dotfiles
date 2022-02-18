-- Import
local utils = require("config.utils")
local keymap = utils.keymap

-- Set leader to spaces
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- NORMAL MODE --
-- Better Window Navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Buffer Navigation
keymap("n", "L", ":bnext<CR>")
keymap("n", "H", ":bprevious<CR>")

-- Swap Lines
keymap("n", "<Leader>j", "<Esc>:m .+1<CR>==")
keymap("n", "<Leader>k", "<Esc>:m .-2<CR>==")


-- INSERT MODE --


-- VISUAL MODE --
-- Swap Lines
keymap("v", "<Leader>j", ":m '>+1<CR>gv=gv")
keymap("v", "<Leader>k", ":m '<-2<CR>gv=gv")
