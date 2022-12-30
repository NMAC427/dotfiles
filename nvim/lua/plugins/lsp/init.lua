-- Load Server Settigns
function load_settings(modname)
  root = vim.fn.stdpath("config") .. "/lua"
  root = root .. "/" .. modname:gsub("%.", "/")

  settings = {}

  local handle = vim.loop.fs_scandir(root)
  while handle do
    local name, t = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end
    if string.match(name, ".lua") then
      name = name:gsub(".lua$", "")
      settings[name] = require(modname .. "." .. name)
    end
  end

  return settings
end

-- lazy.nvim config
local enabled = require("config").plugins.enable.lsp
return {
  {
    "williamboman/mason-lspconfig.nvim",
    enabled = enabled,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        automatic_installation = true,
      }
    end,
    enabled = enabled,
  },

  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("mason")
      require("plugins.lsp.diagnostics").setup()

      local function on_attach(client, bufnr)
        require("plugins.lsp.keys").setup(bufnr)
        require("plugins.lsp.formatting").setup(client, bufnr)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if status_ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      local options = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local server_settings = load_settings("plugins.lsp.settings")
      for server, opts in pairs(server_settings) do
        opts = vim.tbl_deep_extend("force", {}, options, opts or {})
        require("lspconfig")[server].setup(opts)
      end
    end,
    enabled = enabled,
  },
}
