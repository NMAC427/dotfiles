local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
  config = {
    exclude = {
      filetypes = {
        "help",
        "man",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "checkhealth",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
        "lsp-installer",
      },
    },
  },
}

return M
