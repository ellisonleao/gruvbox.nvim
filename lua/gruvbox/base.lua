local colors = require("gruvbox.colors")
local utils = require("gruvbox.utils")

-- options (dark mode by default)
local bg0 = colors.dark0
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
local gray = colors.gray

local bg = vim.o.background
if bg == nil then
  bg = "dark"
  vim.o.background = bg
end

-- swap colors if light mode
if bg == "light" then
  bg0 = colors.light0
  bg1 = colors.light1
  bg2 = colors.light2
  bg3 = colors.light3
  bg4 = colors.light4
  fg0 = colors.dark0
  fg1 = colors.dark1
  fg2 = colors.dark2
  fg3 = colors.dark3
  fg4 = colors.dark4
  red = colors.faded_red
  green = colors.faded_green
  yellow = colors.faded_yellow
  blue = colors.faded_blue
  purple = colors.faded_purple
  aqua = colors.faded_aqua
  orange = colors.faded_orange
end

-- handle light/dark contrast settings
local contrast = vim.g["gruvbox_contrast_" .. bg]
if contrast == "hard" then
  bg0 = colors[bg .. "0_hard"]
elseif contrast == "soft" then
  bg0 = colors[bg .. "0_soft"]
end

-- extending colors table with basic names for easy customization in g:gruvbox_* options
colors.bg0 = bg0
colors.bg1 = bg1
colors.bg2 = bg2
colors.bg3 = bg3
colors.bg4 = bg4
colors.fg0 = fg0
colors.fg1 = fg1
colors.fg2 = fg2
colors.fg3 = fg3
colors.fg4 = fg4
colors.red = red
colors.green = green
colors.yellow = yellow
colors.blue = blue
colors.purple = purple
colors.aqua = aqua
colors.orange = orange

local hls_cursor = utils.get_color_from_var(vim.g.gruvbox_hls_cursor, orange, colors)
local hls_highlight = utils.get_color_from_var(vim.g.gruvbox_hls_highlight, yellow, colors)
local number_column = utils.get_color_from_var(vim.g.gruvbox_number_column, nil, colors)
local color_column = utils.get_color_from_var(vim.g.gruvbox_color_column, bg1, colors)
local vert_split = utils.get_color_from_var(vim.g.gruvbox_vert_split, bg0, colors)
local tabline_sel = utils.get_color_from_var(vim.g.gruvbox_tabline_sel, green, colors)
local sign_column = utils.get_color_from_var(vim.g.gruvbox_sign_column, bg1, colors)
local cursor_line = utils.get_color_from_var(vim.g.gruvbox_cursor_line, bg1, colors)

local improved_strings_fg = fg1
local improved_strings_bg = bg1

local special_string_fg = orange
local special_string_bg = bg1

if not vim.g.gruvbox_improved_strings then
  improved_strings_fg = green
  improved_strings_bg = nil
  special_string_bg = nil
end

-- neovim terminal mode colors
vim.g.terminal_color_0 = bg0
vim.g.terminal_color_8 = gray
vim.g.terminal_color_1 = colors.neutral_red
vim.g.terminal_color_9 = red
vim.g.terminal_color_2 = colors.neutral_green
vim.g.terminal_color_10 = green
vim.g.terminal_color_3 = colors.neutral_yellow
vim.g.terminal_color_11 = yellow
vim.g.terminal_color_4 = colors.neutral_blue
vim.g.terminal_color_12 = blue
vim.g.terminal_color_5 = colors.neutral_purple
vim.g.terminal_color_13 = purple
vim.g.terminal_color_6 = colors.neutral_aqua
vim.g.terminal_color_14 = aqua
vim.g.terminal_color_7 = fg4
vim.g.terminal_color_15 = fg1

vim.g.colors_name = "gruvbox"

local base_group = {
  -- Base groups
  GruvboxFg0 = { fg = fg0 },
  GruvboxFg1 = { fg = fg1 },
  GruvboxFg2 = { fg = fg2 },
  GruvboxFg3 = { fg = fg3 },
  GruvboxFg4 = { fg = fg4 },
  GruvboxGray = { fg = gray },
  GruvboxBg0 = { fg = bg0 },
  GruvboxBg1 = { fg = bg1 },
  GruvboxBg2 = { fg = bg2 },
  GruvboxBg3 = { fg = bg3 },
  GruvboxBg4 = { fg = bg4 },

  GruvboxRed = { fg = red },
  GruvboxRedBold = { fg = red, bold = vim.g.gruvbox_bold },
  GruvboxGreen = { fg = green },
  GruvboxGreenBold = { fg = green, bold = vim.g.gruvbox_bold },
  GruvboxYellow = { fg = yellow },
  GruvboxYellowBold = { fg = yellow, bold = vim.g.gruvbox_bold },
  GruvboxBlue = { fg = blue },
  GruvboxBlueBold = { fg = blue, bold = vim.g.gruvbox_bold },
  GruvboxPurple = { fg = purple },
  GruvboxPurpleBold = { fg = purple, bold = vim.g.gruvbox_bold },
  GruvboxAqua = { fg = aqua },
  GruvboxAquaBold = { fg = aqua, bold = vim.g.gruvbox_bold },
  GruvboxOrange = { fg = orange },
  GruvboxOrangeBold = { fg = orange, bold = vim.g.gruvbox_bold },

  GruvboxRedSign = { fg = red, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
  GruvboxGreenSign = { fg = green, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
  GruvboxYellowSign = { fg = yellow, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
  GruvboxBlueSign = { fg = blue, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
  GruvboxPurpleSign = { fg = purple, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
  GruvboxAquaSign = { fg = aqua, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },
  GruvboxOrangeSign = { fg = orange, bg = sign_column, reverse = vim.g.gruvbox_invert_signs },

  GruvboxRedUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = red },
  GruvboxGreenUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = green },
  GruvboxYellowUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = yellow },
  GruvboxBlueUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = blue },
  GruvboxPurpleUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = purple },
  GruvboxAquaUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = aqua },
  GruvboxOrangeUnderline = { undercurl = vim.g.gruvbox_undercurl, sp = orange },

  ColorColumn = { bg = color_column },
  Conceal = { fg = blue },
  Cursor = { reverse = vim.g.gruvbox_inverse },
  lCursor = "Cursor",
  iCursor = "Cursor",
  vCursor = "Cursor",
  CursorIM = "Cursor",
  CursorLine = { bg = cursor_line },
  CursorColumn = "CursorLine",
  Directory = "GruvboxGreenBold",
  DiffAdd = { fg = green, bg = bg0, reverse = vim.g.gruvbox_inverse },
  DiffChange = { fg = aqua, bg = bg0, reverse = vim.g.gruvbox_inverse },
  DiffDelete = { fg = red, bg = bg0, reverse = vim.g.gruvbox_inverse },
  DiffText = { fg = yellow, bg = bg0, reverse = vim.g.gruvbox_inverse },
  ErrorMsg = { fg = bg0, bg = red, bold = vim.g.gruvbox_bold },
  VertSplit = { fg = bg3, bg = vert_split },
  Folded = { fg = gray, bg = bg1, italic = vim.g.gruvbox_italic },
  FoldColumn = { fg = gray, bg = bg1 },
  SignColumn = { bg = sign_column },
  IncSearch = { fg = hls_cursor, bg = bg0, reverse = vim.g.gruvbox_inverse },
  LineNr = { fg = bg4, bg = number_column },
  CursorLineNr = { fg = yellow, bg = bg1 },
  MatchParen = { bg = bg3, bold = vim.g.gruvbox_bold },
  ModeMsg = "GruvboxYellowBold",
  MoreMsg = "GruvboxYellowBold",
  NonText = "GruvboxBg2",
  Normal = { fg = fg1, bg = bg0 },
  Pmenu = { fg = fg1, bg = bg2 },
  PmenuSel = { fg = bg2, bg = blue, bold = vim.g.gruvbox_bold },
  PmenuSbar = { bg = bg2 },
  PmenuThumb = { bg = bg4 },
  Question = "GruvboxOrangeBold",
  QuickFixLine = { bg = bg0, bold = vim.g.gruvbox_bold },
  Search = { fg = hls_highlight, bg = bg0, reverse = vim.g.gruvbox_inverse },
  SpecialKey = "GruvboxFg4",
  SpellRare = "GruvboxPurpleUnderline",
  SpellBad = "GruvboxRedUnderline",
  SpellLocal = "GruvboxAquaUnderline",
  SpellCap = vim.g.gruvbox_improved_warnings and {
    fg = green,
    bold = vim.g.gruvbox_bold,
    italic = vim.g.gruvbox_italic,
  } or "GruvboxBlueUnderline",
  StatusLine = { fg = bg2, bg = fg1, reverse = vim.g.gruvbox_inverse },
  StatusLineNC = { fg = bg1, bg = fg4, reverse = vim.g.gruvbox_inverse },
  TabLineFill = { fg = bg4, bg = bg1, reverse = vim.g.gruvbox_invert_tabline },
  TabLine = "TabLineFill",
  TabLineSel = { fg = tabline_sel, bg = bg1, reverse = vim.g.gruvbox_invert_tabline },
  Title = "GruvboxGreenBold",
  Visual = { bg = bg3, reverse = vim.g.gruvbox_invert_selection },
  VisualNOS = "Visual",
  WarningMsg = "GruvboxRedBold",
  WildMenu = { fg = blue, bg = bg2, bold = vim.g.gruvbox_bold },
  Constant = "GruvboxPurple",
  Special = { fg = special_string_fg, bg = special_string_bg, italic = vim.g.gruvbox_improved_strings },
  String = {
    fg = improved_strings_fg,
    bg = improved_strings_bg,
    italic = vim.g.gruvbox_italicize_strings,
  },
  Character = "GruvboxPurple",
  Number = "GruvboxPurple",
  Boolean = "GruvboxPurple",
  Float = "GruvboxPurple",
  Identifier = "GruvboxBlue",
  Function = "GruvboxGreenBold",
  Statement = "GruvboxRed",
  Conditional = "GruvboxRed",
  Repeat = "GruvboxRed",
  Label = "GruvboxRed",
  Exception = "GruvboxRed",
  Keyword = "GruvboxRed",
  Operator = "GruvboxFg1",
  PreProc = "GruvboxAqua",
  Include = "GruvboxAqua",
  Define = "GruvboxAqua",
  Macro = "GruvboxAqua",
  PreCondit = "GruvboxAqua",
  Type = "GruvboxYellow",
  StorageClass = "GruvboxOrange",
  Structure = "GruvboxAqua",
  Typedef = "GruvboxYellow",
  SpecialChar = "GruvboxRed",
  Tag = "GruvboxAquaBold",
  Delimiter = "GruvboxFg3",
  Comment = { fg = gray, italic = vim.g.gruvbox_italic_comments },
  Debug = "GruvboxRed",
  Underlined = { fg = blue, underline = vim.g.gruvbox_underline },
  Bold = { bold = vim.g.gruvbox_bold },
  Italic = { italic = vim.g.gruvbox_italic },
  Ignore = {},
  Error = { fg = red, bold = vim.g.gruvbox_bold, reverse = vim.g.gruvbox_inverse },
  Todo = { fg = fg0, bold = vim.g.gruvbox_bold, italic = vim.g.gruvbox_italic },
  diffAdded = "GruvboxGreen",
  diffRemoved = "GruvboxRed",
  diffChanged = "GruvboxAqua",
  diffFile = "GruvboxOrange",
  diffNewFile = "GruvboxYellow",
  diffLine = "GruvboxBlue",
  -- signature
  SignatureMarkText = "GruvboxBlueSign",
  SignatureMarkerText = "GruvboxPurpleSign",
  -- gitcommit
  gitcommitSelectedFile = "GruvboxGreen",
  gitcommitDiscardedFile = "GruvboxRed",
  -- checkhealth
  healthError = { fg = bg0, bg = red },
  healthSuccess = { fg = bg0, bg = green },
  healthWarning = { fg = bg0, bg = yellow },
}

return base_group
