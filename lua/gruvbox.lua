local Color, colors, Group, groups, styles = require("colorbuddy").setup()

-- color palette
local palette = {
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
}

for k, item in pairs(palette) do
  Color.new(k, item)
end

Color.new("gray", "#928374")

-- options
-- TODO(ellisonleao) handle light vs dark modes

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
local sign_column = bg1

-- global settings
local settings = {
  bold = true,
  italic = true,
  undercurl = true,
  underline = true,
  inverse = true,
  improved_strings = false,
  improved_warnings = false,
  invert = false,
  invert_signs = false,
  invert_selection = true,
  invert_tabline = false,
  italicize_comments = true,
  italicize_strings = false,
}

-- setting default values
for k, val in pairs(settings) do
  local key = "gruvbox_" .. k
  if vim.g[key] == nil then
    vim.g[key] = val
  end
end

local sign_column = bg1

local hls_cursor = orange
if vim.g.gruvbox_hls_cursor ~= nil then
  hls_cursor = colors[vim.g.gruvbox_hls_cursor]
end

local number_column = styles.none
if vim.g.gruvbox_number_column ~= nil then
  number_column = colors[vim.g.gruvbox_number_column]
end

local color_column = bg1
if vim.g.gruvbox_color_column ~= nil then
  color_column = colors[vim.g.gruvbox_color_column]
end

local vert_split = bg0
if vim.g.gruvbox_vert_split ~= nil then
  vert_split = colors[vim.g.gruvbox_vert_split]
end

local invert_signs
if vim.g.gruvbox_invert_signs then
  invert_signs = styles.inverse
end

local invert_selection = styles.inverse
if not vim.g.gruvbox_invert_selection then
  invert_selection = nil
end

local invert_tabline
if vim.g.gruvbox_invert_tabline then
  invert_tabline = styles.inverse
end

local italic_comments = styles.italic
if not vim.g.gruvbox_italicize_comments then
  italic_comments = nil
end

local italic_strings
if vim.g.gruvbox_italicize_strings then
  italic_strings = styles.italic
end

-- foregrounds
Group.new("GruvboxGray", colors.gray)
Group.new("GruvboxFg0", fg0)
Group.new("GruvboxFg1", fg1)
Group.new("GruvboxFg2", fg2)
Group.new("GruvboxFg3", fg3)
Group.new("GruvboxFg4", fg4)
Group.new("GruvboxGray", colors.gray)

-- backgrounds
Group.new("GruvboxBg0", bg0)
Group.new("GruvboxBg1", bg1)
Group.new("GruvboxBg2", bg2)
Group.new("GruvboxBg3", bg3)
Group.new("GruvboxBg4", bg4)

-- color groups
Group.new("GruvboxAqua", aqua)
Group.new("GruvboxAquaBold", aqua, nil, styles.bold)
Group.new("GruvboxBlue", blue)
Group.new("GruvboxBlueBold", blue, nil, styles.bold)
Group.new("GruvboxGreen", green)
Group.new("GruvboxGreenBold", green, nil, styles.bold)
Group.new("GruvboxOrange", orange)
Group.new("GruvboxOrangeBold", orange, nil, styles.bold)
Group.new("GruvboxPurple", purple)
Group.new("GruvboxPurpleBold", purple, nil, styles.bold)
Group.new("GruvboxRed", red)
Group.new("GruvboxRedBold", red, nil, styles.bold)
Group.new("GruvboxYellow", yellow)
Group.new("GruvboxYellowBold", yellow, nil, styles.bold)

-- signs
Group.new("GruvboxAquaSign", aqua, bg1, invert_signs)
Group.new("GruvboxBlueSign", blue, bg1, invert_signs)
Group.new("GruvboxGreenSign", green, bg1, invert_signs)
Group.new("GruvboxOrangeSign", orange, bg1, invert_signs)
Group.new("GruvboxPurpleSign", purple, bg1, invert_signs)
Group.new("GruvboxRedSign", red, bg1, invert_signs)
Group.new("GruvboxYellowSign", yellow, bg1, invert_signs)

-- base highlight groups
Group.new("Normal", fg1, bg0)
Group.new("CursorLine", nil, bg1)
Group.new("CursorColumn", groups.CursorLine)
Group.new("TabLineFill", bg4, bg1, invert_tabline)
Group.new("TabLineSel", green, bg1, invert_tabline)
Group.new("TabLine", groups.TabLineFill)
Group.new("MatchParen", nil, bg3, styles.bold)
Group.new("ColorColumn", nil, color_column)
Group.new("Conceal", blue, nil)
Group.new("CursorLineNr", yellow, bg1)
Group.new("NonText", groups.GruvboxBg2)
Group.new("SpecialKey", groups.GruvboxBg2)
Group.new("Visual", nil, bg3, invert_selection)
Group.new("VisualNOS", groups.Visual)
Group.new("Search", yellow, bg0, styles.inverse)
Group.new("IncSearch", yellow, hls_cursor, styles.inverse)
Group.new("Underlined", blue, nil, styles.underline)
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
Group.new("LineNr", bg4, nil)
Group.new("SignColumn", bg4, sign_column)
Group.new("Folded", colors.gray, bg1, styles.italic)
Group.new("FoldColumn", colors.gray, bg1)

Group.new("Cursor", nil, nil, styles.inverse)
Group.new("iCursor", groups.Cursor)
Group.new("lCursor", groups.Cursor)
Group.new("vCursor", groups.Cursor)

-- Syntax highlight
if vim.g.gruvbox_improved_strings then
  Group.new("Special", bg0, orange, styles.italic)
  Group.new("String", fg1, bg0, italic_strings)
else
  Group.new("Special", groups.GruvboxOrange)
  Group.new("String", green, nil, italic_strings)
end

-- TODO(ellisonleao)
Group.new("Comment", colors.gray, nil, nil, italic_comments)
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

-- Completion menu
Group.new("Pmenu", fg1, bg2)
Group.new("PmenuSel", bg2, blue, styles.bold)
Group.new("PmenuSbar", nil, bg2)
Group.new("PmenuThumb", nil, bg4)

-- Diffs
Group.new("DiffChange", aqua, bg0, styles.inverse)
Group.new("DiffText", yellow, bg0, styles.inverse)

-- Spelling
-- TODO(ellisonleao)

-- Plugin specific
-- (ellisonleao) addings the ones i am using for now

-- vim-signify
Group.new("SignifySignAdd", groups.GruvboxGreenSign)
Group.new("SignifySignChange", groups.GruvboxAquaSign)
Group.new("SignifySignDelete", groups.GruvboxRedSign)

-- vim-startify
Group.new("StartifyBracket", groups.GruvboxFg3)
Group.new("StartifyFile", groups.GruvboxFg1)
Group.new("StartifyNumber", groups.GruvboxBlue)
Group.new("StartifyPath", groups.GruvboxGray)
Group.new("StartifySlash", groups.GruvboxGray)
Group.new("StartifySection", groups.GruvboxYellow)
Group.new("StartifySpecial", groups.GruvboxBg2)
Group.new("StartifyHeader", groups.GruvboxOrange)
Group.new("StartifyFooter", groups.GruvboxBg2)

-- netrw
Group.new("netrwDir", groups.GruvboxAqua)
Group.new("netrwClassify", groups.GruvboxAqua)
Group.new("netrwLink", groups.GruvboxGray)
Group.new("netrwSymLink", groups.GruvboxFg1)
Group.new("netrwExe", groups.GruvboxYellow)
Group.new("netrwComment", groups.GruvboxGray)
Group.new("netrwList", groups.GruvboxBlue)
Group.new("netrwHelpCmd", groups.GruvboxAqua)
Group.new("netrwCmdSep", groups.GruvboxFg3)
Group.new("netrwVersion", groups.GruvboxGreen)

-- filetype specific 
