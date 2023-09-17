---@class Gruvbox
---@field config GruvboxConfig
local Gruvbox = {}

---@alias Contrast "hard" | "soft" | ""

---@class ItalicConfig
---@field strings boolean
---@field comments boolean
---@field operators boolean
---@field folds boolean

---@class HighlightDefinition
---@field fg string
---@field bg string
---@field sp string
---@field blend integer
---@field bold boolean
---@field standout boolean
---@field underline boolean
---@field undercurl boolean
---@field underdouble boolean
---@field underdotted boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean

---@class GruvboxConfig
---@field undercurl boolean
---@field underline boolean
---@field bold boolean
---@field italic ItalicConfig
---@field strikethrough boolean
---@field contrast Contrast
---@field invert_selection boolean
---@field invert_signs boolean
---@field invert_tabline boolean
---@field invert_intend_guides boolean
---@field inverse boolean invert background for search, diffs, statuslines and errors
---@field overrides table<string, HighlightDefinition>
---@field palette_overrides table<string, string>
Gruvbox.config = {
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}

---@param config GruvboxConfig?
function Gruvbox.setup(config)
  Gruvbox.config = vim.tbl_deep_extend("force", Gruvbox.config, config or {})
end

--- main load function
Gruvbox.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("gruvbox.nvim: you must use neovim 0.8 or higher")
    return
  end

  -- reset colors
  vim.cmd.hi("clear")
  vim.g.colors_name = "gruvbox"
  vim.o.termguicolors = true

  local groups = require("gruvbox.groups").setup(Gruvbox.config)

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return Gruvbox
