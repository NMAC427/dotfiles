function load_module(module)
  local ok, mod = pcall(require, module)
  if not ok then
    error("Error loading module " .. module .. "\n\n" .. mod)
  end
  return mod
end

load_module("options")
load_module("mappings").misc()
load_module("load_plugins")
load_module("colorscheme")
load_module("autocommands")
load_module("filetype")
