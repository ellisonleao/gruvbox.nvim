local lush = require("lush")
local base = require("gruvbox.base")
local plugins = require("gruvbox.plugins.highlights")
local languages = require("gruvbox.languages")

local specs = {base, languages, plugins}
local spec = lush.merge(specs)

-- checking if user has lightline and adding support
require("gruvbox.plugins.lightline").start(spec)

return spec
