vim.cmd([[

  " Highlight on yank
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end

  " cmp debounce
  " augroup CmpDebounceAuGroup
  "   au!
  "   au TextChangedI * lua require("plugins.extensions.cmp").debounce()
  " augroup end

]])
