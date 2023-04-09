-- gruvbox palette
local M = {}

M.colors = {
  dark0_hard = "#1d2021",
  dark0 = "#282828",
  dark0_soft = "#32302f",
  dark1 = "#3c3836",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",
  light0_hard = "#f9f5d7",
  light0 = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1 = "#ebdbb2",
  light2 = "#d5c4a1",
  light3 = "#bdae93",
  light4 = "#a89984",
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",
  gray = "#928374",
  dark0_red_soft = "#5a3530",
  dark0_green_soft = "#4d4c2d",
  dark0_yellow_soft = "#6e5a2f",
  dark0_blue_soft = "#4a534f",
  dark0_red = "#522f2a",
  dark0_green = "#454528",
  dark0_yellow = "#67552a",
  dark0_blue = "#434e4a",
  dark0_red_hard = "#492825",
  dark0_green_hard = "#3c3f22",
  dark0_yellow_hard = "#5f4f25",
  dark0_blue_hard = "#3c4845",
  light0_red_soft = "#d08973",
  light0_green_soft = "#c2b876",
  light0_yellow_soft = "#e0c48a",
  light0_blue_soft = "#acbfa8",
  light0_red = "#d5917a",
  light0_green = "#c7bf7d",
  light0_yellow = "#e6cc91",
  light0_blue = "#b2c7af",
  light0_red_hard = "#d49383",
  light0_green_hard = "#c6c187",
  light0_yellow_hard = "#e5cf9d",
  light0_blue_hard = "#b0cabb",
}

M.get_base_colors = function(bg, contrast)
  local config = require("gruvbox").config
  local p = M.colors

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  if bg == nil then
    bg = vim.o.background
  end

  local colors = {
    dark = {
      bg0 = p.dark0,
      bg1 = p.dark1,
      bg2 = p.dark2,
      bg3 = p.dark3,
      bg4 = p.dark4,
      fg0 = p.light0,
      fg1 = p.light1,
      fg2 = p.light2,
      fg3 = p.light3,
      fg4 = p.light4,
      red = p.bright_red,
      green = p.bright_green,
      yellow = p.bright_yellow,
      blue = p.bright_blue,
      purple = p.bright_purple,
      aqua = p.bright_aqua,
      orange = p.bright_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
      bg0_red = p.dark0_red,
      bg0_green = p.dark0_green,
      bg0_yellow = p.dark0_yellow,
      bg0_blue = p.dark0_blue,
    },
    light = {
      bg0 = p.light0,
      bg1 = p.light1,
      bg2 = p.light2,
      bg3 = p.light3,
      bg4 = p.light4,
      fg0 = p.dark0,
      fg1 = p.dark1,
      fg2 = p.dark2,
      fg3 = p.dark3,
      fg4 = p.dark4,
      red = p.faded_red,
      green = p.faded_green,
      yellow = p.faded_yellow,
      blue = p.faded_blue,
      purple = p.faded_purple,
      aqua = p.faded_aqua,
      orange = p.faded_orange,
      neutral_red = p.neutral_red,
      neutral_green = p.neutral_green,
      neutral_yellow = p.neutral_yellow,
      neutral_blue = p.neutral_blue,
      neutral_purple = p.neutral_purple,
      neutral_aqua = p.neutral_aqua,
      gray = p.gray,
      bg0_red = p.light0_red,
      bg0_green = p.light0_green,
      bg0_yellow = p.light0_yellow,
      bg0_blue = p.light0_blue,
    },
  }

  -- Change background values to match contrast
  if contrast ~= nil and contrast ~= "" then
    local values = { "0", "0_red", "0_green", "0_yellow", "0_blue" }
    for _, value in ipairs(values) do
      local name = bg .. string.format("%s_%s", value, contrast)
      colors[bg]["bg" .. value] = p[name]
    end
  end

  return colors[bg]
end

return M
