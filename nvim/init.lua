-- GENERAL SETTINGS

local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local utils = require("config.utils")
local map = utils.map

-- Set leader to space

g.mapleader = ' '

-- Dependencies

require("plugins")

-- General

cmd [[ language messages en_US.UTF-8 ]]	-- Set language to en_US

g.loaded_python_provider = 0		-- Don't load python2 provider
g.python3_host_prog = vim.env.HOME .. '/.venvs/nvim/bin/python3'	-- Set python3 executable path

-- Visual

opt.number = true			-- Show line numbers
opt.relativenumber = true		-- Make line numbers relative
opt.signcolumn = 'yes'			-- Sign Column

---- Color Scheme

vim.o.termguicolors = true		-- Enable 24-bit true color
vim.g.onedark_terminal_italics = 1	-- Enable italics
vim.g.background = 'dark'		-- Dark Background?
vim.cmd [[colorscheme onedark]]		-- Color scheme

vim.g.lightline = {
  colorscheme = 'onedark',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Behavioral

opt.ignorecase = true			-- Case insensitive searching unless /C or capital in search.
opt.smartcase = true
opt.mouse = 'a'				-- Enable mouse mode
opt.clipboard = 'unnamedplus'		-- OS clipboard sync

-- Vim specific

opt.undofile = true			-- Save undo history
opt.swapfile = false			-- Disable swap file 
opt.breakindent = true			-- Enable break indent.
opt.updatetime = 250			-- Decrease update time

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

