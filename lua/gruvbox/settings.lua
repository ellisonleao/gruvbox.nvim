-- gruvbox settings handler
local settings = {
  contrast_dark = "medium",
  contrast_light = "medium",
  bold = true,
  italic = true,
  undercurl = true,
  underline = true,
  inverse = true,
  improved_strings = false,
  improved_warnings = false,
  invert_signs = false,
  invert_selection = false,
  invert_tabline = false,
  italicize_comments = true,
  italicize_strings = false,
  invert_intend_guides = false,
}

-- setting default values
for k, val in pairs(settings) do
  local key = "gruvbox_" .. k
  if vim.g[key] == nil then
    vim.g[key] = val
  end
end

return settings
