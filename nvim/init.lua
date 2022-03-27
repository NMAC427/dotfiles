-- Impatient for faster lua loading
local impatient_available, impatient = pcall(require, "impatient")
if impatient_available then
  impatient.enable_profile()
end

-- Load modules
local modules = {
  "options",
  "mappings",
  "colorscheme",
  "autocommands",
}

for _, module in ipairs(modules) do
  local ok, mod = pcall(require, module)
  if not ok then
    error("Error loading module " .. module .. "\n\n" .. mod)
  end

  -- Load essential key mappings
  if module == "mappings" then
    mod.misc()
  end
end
