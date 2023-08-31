local M = {}

M.bootstrap = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end

  vim.opt.runtimepath:prepend(lazypath)
end

M.plugins = function()
  local ok_lazy, lazy = pcall(require, "lazy")
  if not ok_lazy then
    return
  end

  -- if user.local.plugins

  lazy.setup({
    spec = {
      { import = "user.plugins" },
    },
    dev = {
      path = "~/workspace/repos/neovim",
      patterns = { "aiko" },
      fallback = true,
    },
    change_detection = {
      enabled = true,
      notify = false,
    },
    performance = {
      rtp = {
        paths = {
          vim.fs.normalize("~/.local/config/nvim"),
        },
      },
    },
  })
end

M.configure_base = function()
  local builtin = require("user.builtin")
  builtin.disable_plugins()
  builtin.disable_providers()

  require("user.globals")
  require("user.filetype")
  require("user.mappings")
  require("user.options")
  require("user.autocmds")
  require("user.commands")

  if vim.fn.exists("neovide") == 1 then
    require("user.neovide")
  end
end

M.setup = function()
  -- Setup packer and plugins
  M.bootstrap()
  M.plugins()

  -- Setup options, key-maps and personal auto commands.
  M.configure_base()
end

return M
