local Color, colors, Group, groups, styles = require("colorbuddy").setup()

-- color palette
local dark = {
  dark0_hard = "#1d2021",
  dark0 = "#282828",
  dark0_soft = "#32302f",
  dark1 = "#3c3836",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",
}

local light = {
  light0_hard = "#f9f5d7",
  light0 = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1 = "#ebdbb2",
  light2 = "#d5c4a1",
  light3 = "#bdae93",
  light4 = "#a89984",
}

for k, item in pairs(dark) do
  Color.new(k, item)
end

for k, item in pairs(light) do
  Color.new(k, item)
end

local bright_colors = {
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",
}

for k, item in pairs(bright_colors) do
  Color.new(k, item)
end

local neutral_colors = {
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",
}

for k, item in pairs(neutral_colors) do
  Color.new(k, item)
end

local faded_colors = {
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",
}

for k, item in pairs(faded_colors) do
  Color.new(k, item)
end

Color.new("gray", "#928374")

-- options
-- TODO(ellisonleao) handle light vs dark modes
local sign_column = colors.dark1

local bg0 = colors.dark0_hard
local bg1 = colors.dark1
local bg2 = colors.dark2
local bg3 = colors.dark3
local bg4 = colors.dark4

local fg0 = colors.light0
local fg1 = colors.light1
local fg2 = colors.light2
local fg3 = colors.light3
local fg4 = colors.light4

local red = colors.bright_red
local green = colors.bright_green
local yellow = colors.bright_yellow
local blue = colors.bright_blue
local purple = colors.bright_purple
local aqua = colors.bright_aqua
local orange = colors.bright_orange

-- vim.g vars
local function get_or_set_default(option, default)
  -- TODO(ellisonleao) validate inputs
  local key = "gruvbox_" .. option
  if vim.g[key] ~= nil then
    return vim.g[key]
  end

  return default
end

-- g:gruvbox_* options
local hls_cursor = get_or_set_default("hls_cursor", orange)
local vert_split = get_or_set_default("vert_split", bg0)
local color_column = get_or_set_default("color_column", bg1)
local number_column = get_or_set_default("number_column", nil)
local improved_strings = get_or_set_default("improved_strings", nil)

-- foregrounds
Group.new("GruvboxGray", colors.gray)
Group.new("GruvboxFg0", fg0)
Group.new("GruvboxFg1", fg1)
Group.new("GruvboxFg2", fg2)
Group.new("GruvboxFg3", fg3)
Group.new("GruvboxFg4", fg4)

-- backgrounds
Group.new("GruvboxBg0", bg0)
Group.new("GruvboxBg1", bg1)
Group.new("GruvboxBg2", bg2)
Group.new("GruvboxBg3", bg3)
Group.new("GruvboxBg4", bg4)

-- color groups
Group.new("GruvboxRed", red)
Group.new("GruvboxRedBold", red, nil, styles.bold)

Group.new("GruvboxGreen", green)
Group.new("GruvboxGreenBold", green, nil, styles.bold)

Group.new("GruvboxYellow", yellow)
Group.new("GruvboxYellowBold", yellow, nil, styles.bold)

Group.new("GruvboxBlue", blue)
Group.new("GruvboxBlueBold", blue, nil, styles.bold)

Group.new("GruvboxPurple", purple)
Group.new("GruvboxPurpleBold", purple, nil, styles.bold)

Group.new("GruvboxAqua", aqua)
Group.new("GruvboxAquaBold", aqua, nil, styles.bold)

Group.new("GruvboxOrange", orange)
Group.new("GruvboxOrangeBold", orange, nil, styles.bold)

-- signs
Group.new("GruvboxRedSign", red, sign_column, styles.inverse)
Group.new("GruvboxGreenSign", green, sign_column, styles.inverse)
Group.new("GruvboxYellowSign", yellow, sign_column, styles.inverse)
Group.new("GruvboxBlueSign", blue, sign_column, styles.inverse)
Group.new("GruvboxPurpleSign", purple, sign_column, styles.inverse)
Group.new("GruvboxAquaSign", aqua, sign_column, styles.inverse)
Group.new("GruvboxOrangeSign", orange, sign_column, styles.inverse)

-- base highlight groups
Group.new("Normal", fg1, bg0)
Group.new("Visual", nil, bg3, styles.inverse)
Group.new("VisualNOS", groups.Visual)
Group.new("CursorLine", nil, bg1)
Group.new("CursorColumn", groups.CursorLine)
Group.new("ColorColumn", color_column)
Group.new("CursorLineNr", yellow, bg1)
Group.new("TabLineFill", bg4, bg1, styles.inverse)
Group.new("TabLineSel", green, bg1, styles.inverse)
Group.new("TabLine", groups.TabLineFill)
Group.new("MatchParen", nil, bg3, styles.bold)
Group.new("Conceal", blue, nil)
Group.new("NonText", groups.GruvboxBg2)
Group.new("SpecialKey", groups.GruvboxBg2)
Group.new("Underlined", blue, nil, styles.underline)
Group.new("Search", yellow, bg0, styles.inverse)
Group.new("IncSearch", yellow, hls_cursor, styles.inverse)
Group.new("StatusLine", bg2, fg1, styles.inverse)
Group.new("StatusLineNC", bg1, fg4, styles.inverse)
Group.new("VertSplit", bg3, vert_split)
Group.new("WildMenu", blue, bg2, styles.bold)
Group.new("Directory", groups.GruvboxGreenBold)
Group.new("Title", groups.GruvboxGreenBold)
Group.new("ErrorMsg", bg0, red, styles.bold)
Group.new("MoreMsg", groups.GruvboxYellowBold)
Group.new("ModeMsg", groups.GruvboxYellowBold)
Group.new("Question", groups.GruvboxOrangeBold)
Group.new("WarningMsg", groups.GruvboxRedBold)
Group.new("LineNr", bg4, number_column)
Group.new("SignColumn", bg4, sign_column)
Group.new("Folded", colors.gray, bg1, styles.italic)
Group.new("FoldColumn", colors.gray, bg1)
Group.new("Cursor", nil, nil, styles.inverse)
Group.new("vCursor", groups.Cursor)
Group.new("iCursor", groups.Cursor)
Group.new("lCursor", groups.Cursor)

-- Syntax highlight
if improved_strings == nil then
  Group.new("Special", groups.GruvboxOrange)
  Group.new("String", green, nil, styles.italic)
else
  Group.new("Special", orange, bg1, styles.italic)
  Group.new("String", fg1, bg1, styles.italic)
end

Group.new("Comment", colors.gray, nil, styles.italic)
Group.new("Todo", fg0, bg0, styles.bold, styles.italic)
Group.new("Error", red, bg0, styles.bold, styles.inverse)
Group.new("Statement", groups.GruvboxRed)
Group.new("Conditional", groups.GruvboxRed)
Group.new("Repeat", groups.GruvboxRed)
Group.new("Label", groups.GruvboxRed)
Group.new("Exception", groups.GruvboxRed)
Group.new("Operator", groups.Normal)
Group.new("Keyword", groups.GruvboxRed)
Group.new("Identifier", groups.GruvboxBlue)
Group.new("Function", groups.GruvboxGreenBold)
Group.new("PreProc", groups.GruvboxAqua)
Group.new("Include", groups.GruvboxAqua)
Group.new("Define", groups.GruvboxAqua)
Group.new("Macro", groups.GruvboxAqua)
Group.new("PreCondit", groups.GruvboxAqua)
Group.new("Constant", groups.GruvboxPurple)
Group.new("Character", groups.GruvboxPurple)
Group.new("Boolean", groups.GruvboxPurple)
Group.new("Number", groups.GruvboxPurple)
Group.new("Float", groups.GruvboxPurple)
Group.new("Type", groups.GruvboxYellow)
Group.new("StorageClass", groups.GruvboxYellow)
Group.new("Structure", groups.GruvboxYellow)
Group.new("Typedef", groups.GruvboxYellow)

-- Plugin specific

-- GitGutter
Group.new("GitGutterAdd", groups.GruvboxGreenSign)
Group.new("GitGutterChange", groups.GruvboxAquaSign)
Group.new("GitGutterDelete", groups.GruvboxRedSign)
Group.new("GitGutterChangeDelete", groups.GruvboxAquaSign)

-- gitcommit
Group.new("gitcommitSelectedFile", groups.GruvboxGreen)
Group.new("gitcommitDiscardedFile", groups.GruvboxRed)
