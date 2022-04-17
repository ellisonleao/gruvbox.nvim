local base = require("gruvbox.base")
local plugins = require("gruvbox.plugins")
local languages = require("gruvbox.languages")
local utils = require("gruvbox.utils")

local specs = { base, languages, plugins }
local spec = utils.merge(specs)

local M = {}
M.load = function()
  if vim.version().minor < 7 then
    vim.api.nvim_err_writeln("gruvbox.nvim: you must use neovim 0.7 or higher")
    return
  end

  vim.opt.termguicolors = true
  utils.add_highlights(spec)
end

return M
