local base = require("gruvbox.base")
local plugins = require("gruvbox.plugins.highlights")
local languages = require("gruvbox.languages")
local utils = require("gruvbox.utils")

local specs = { base, languages, plugins }
local spec = utils.merge(specs)

local M = {}
M.load = function()
  utils.add_highlights(spec)
end

return M
