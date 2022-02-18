local options = {
  -- VISUAL --
  number = true,                    -- Show line numbers
  relativenumber = true,            -- Make line numbers relative
  signcolumn = "yes",               -- Always display the sign columin
  wrap = false,                     -- Wrap long lines
  linebreak = true,                 -- Wrap at word boundaries
  breakindent = true,               -- Indent wrapped lines
  scrolloff = 8,                    -- Keep cursor more centered
  sidescrolloff = 8,                -- Keep cursor more centered: horizontally
  showtabline = 2,                  -- Always show tabline
  colorcolumn = "80",               -- Highligh column 80

  -- BEHAVIORAL --
  ignorecase = true,                -- Case insensitive search unless /C or capital in search.
  smartcase = true,                 -- Override ignorecase if the search pattern contains capitals.
  smartindent = true,               -- Smart indenting
  textwidth = 80,                   
  mouse = "a",                      -- Enable mouse support
  clipboard = "unnamedplus",        -- Enable OS clipboard sync
  whichwrap = "b,s,<,>,[,]",        -- Make arrow keys wrap at end of line
  undofile = true,                  -- Save edit history to disk
  swapfile = true,                  -- Enable swap file
  updatetime = 300,                 -- Faster completion
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


-- Set language to en_US
vim.cmd [[ language messages en_US.UTF-8 ]]

-- Set python provider to speed up loading
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = vim.env.HOME .. "/.venvs/nvim/bin/python3"

