-- This file initializes packer. If no packer installation can be found,
-- it installs it automatically.

pcall(vim.cmd, [[packadd packer.nvim]])

local present, packer = pcall(require, "packer")

if not present then
  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  -- Clone Packer
  print("Cloning Packer...")
  vim.fn.delete(packer_path, "rf")
  vim.fn.system {
    "git",
    "clone",
    "--depth",
    "10",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  }

  vim.cmd([[packadd packer.nvim]])
  present, packer = pcall(require, "packer")

  if present then
    print("Packer installed successfully.")
  else
    error("Couldn't install packer!\n\n" .. packer)
  end
end

packer.init {
  auto_clean = true,
  compile_on_sync = true,
}

return packer
