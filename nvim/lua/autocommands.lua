vim.cmd([[

  " Highlight on yank
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end

  " Automatically recompile packer plugins file
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */nvim/lua/plugins/init.lua source <afile> | PackerCompile
  augroup end

  " cmp debounce
  " augroup CmpDebounceAuGroup
  "   au!
  "   au TextChangedI * lua require("plugins.extensions.cmp").debounce()
  " augroup end

]])
