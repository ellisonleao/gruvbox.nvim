local lush = require("lush")
local convert = require("lush.hsl.convert")
local colors = require("gruvbox.colors")
local styles = require("gruvbox.settings").styles
local utils = require("gruvbox.utils")
local hsl = lush.hsl

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
local sign_column = bg1

-- handle light/dark contrast settings
local bg = vim.o.background
if bg == nil then
  bg = "dark"
  vim.o.background = bg
end

local contrast = vim.g["gruvbox_contrast_" .. bg]
if contrast == "hard" then
  bg0 = colors[bg .. "0_hard"]
elseif contrast == "soft" then
  bg0 = colors[bg .. "0_soft"]
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

local hls_cursor = orange
if vim.g.gruvbox_hls_cursor ~= nil then
  hls_cursor = hsl(colors[vim.g.gruvbox_hls_cursor])
end

local hls_highlight = yellow
if vim.g.gruvbox_hls_cursor ~= nil then
  hls_highlight = hsl(colors[vim.g.gruvbox_hls_highlight])
end

local number_column
if vim.g.gruvbox_number_column ~= nil then
  number_column = hsl(colors[vim.g.gruvbox_number_column])
end

local color_column = bg1
if vim.g.gruvbox_color_column ~= nil then
  color_column = hsl(colors[vim.g.gruvbox_color_column])
end

local vert_split = bg0
if vim.g.gruvbox_vert_split ~= nil then
  vert_split = hsl(colors[vim.g.gruvbox_vert_split])
end

local tabline_sel = green
if utils.tobool(vim.g.gruvbox_tabline_sel) then
  tabline_sel = hsl(colors[vim.g.gruvbox_tabline_sel])
end

local improved_strings_fg = fg1
local improved_strings_bg = bg1
local improved_strings_gui = styles.italic_strings

local special_string_fg = orange
local special_string_bg = bg1
local special_string_gui = styles.italic_strings

if not vim.g.gruvbox_improved_strings then
  improved_strings_fg = green
  improved_strings_bg = nil

  special_string_bg = nil
  special_string_gui = nil
end

-- neovim terminal mode colors
vim.g.terminal_color_0 = convert.hsl_to_hex(bg0)
vim.g.terminal_color_8 = convert.hsl_to_hex(gray)
vim.g.terminal_color_1 = convert.hsl_to_hex(colors.neutral_red)
vim.g.terminal_color_2 = convert.hsl_to_hex(red)
vim.g.terminal_color_10 = convert.hsl_to_hex(green)
vim.g.terminal_color_3 = convert.hsl_to_hex(colors.neutral_yellow)
vim.g.terminal_color_11 = convert.hsl_to_hex(yellow)
vim.g.terminal_color_4 = convert.hsl_to_hex(colors.neutral_blue)
vim.g.terminal_color_12 = convert.hsl_to_hex(blue)
vim.g.terminal_color_5 = convert.hsl_to_hex(colors.neutral_purple)
vim.g.terminal_color_13 = convert.hsl_to_hex(purple)
vim.g.terminal_color_6 = convert.hsl_to_hex(colors.neutral_aqua)
vim.g.terminal_color_14 = convert.hsl_to_hex(aqua)
vim.g.terminal_color_7 = convert.hsl_to_hex(fg4)
vim.g.terminal_color_15 = convert.hsl_to_hex(fg1)

vim.g.colors_name = "gruvbox"

local base_group = lush(function()
  return {
    -- Base groups
    GruvboxFg0 {fg = fg0},
    GruvboxFg1 {fg = fg1},
    GruvboxFg2 {fg = fg2},
    GruvboxFg3 {fg = fg3},
    GruvboxFg4 {fg = fg4},
    GruvboxGray {fg = gray},
    GruvboxBg0 {fg = bg0},
    GruvboxBg1 {fg = bg1},
    GruvboxBg2 {fg = bg2},
    GruvboxBg3 {fg = bg3},
    GruvboxBg4 {fg = bg4},

    GruvboxRed {fg = red},
    GruvboxRedBold {fg = red, gui = styles.bold},
    GruvboxGreen {fg = green},
    GruvboxGreenBold {fg = green, gui = styles.bold},
    GruvboxYellow {fg = yellow},
    GruvboxYellowBold {fg = yellow, gui = styles.bold},
    GruvboxBlue {fg = blue},
    GruvboxBlueBold {fg = blue, gui = styles.bold},
    GruvboxPurple {fg = purple},
    GruvboxPurpleBold {fg = purple, gui = styles.bold},
    GruvboxAqua {fg = aqua},
    GruvboxAquaBold {fg = aqua, gui = styles.bold},
    GruvboxOrange {fg = orange},
    GruvboxOrangeBold {fg = orange, gui = styles.bold},

    GruvboxRedSign {fg = red, bg = sign_column, gui = styles.invert_signs},
    GruvboxGreenSign {fg = green, bg = sign_column, gui = styles.invert_signs},
    GruvboxYellowSign {fg = yellow, bg = sign_column, gui = styles.invert_signs},
    GruvboxBlueSign {fg = blue, bg = sign_column, gui = styles.invert_signs},
    GruvboxPurpleSign {fg = purple, bg = sign_column, gui = styles.invert_signs},
    GruvboxAquaSign {fg = aqua, bg = sign_column, gui = styles.invert_signs},
    GruvboxOrangeSign {fg = orange, bg = sign_column, gui = styles.invert_signs},

    GruvboxRedUnderline {gui = styles.undercurl, sp = red},
    GruvboxGreenUnderline {gui = styles.undercurl, sp = green},
    GruvboxYellowUnderline {gui = styles.undercurl, sp = yellow},
    GruvboxBlueUnderline {gui = styles.undercurl, sp = blue},
    GruvboxPurpleUnderline {gui = styles.undercurl, sp = purple},
    GruvboxAquaUnderline {gui = styles.undercurl, sp = aqua},
    GruvboxOrangeUnderline {gui = styles.undercurl, sp = orange},

    ColorColumn {bg = color_column},
    Conceal {fg = blue},
    Cursor {gui = styles.inverse},
    lCursor {Cursor},
    iCursor {Cursor},
    vCursor {Cursor},
    CursorIM {Cursor},
    CursorLine {bg = bg1},
    CursorColumn {CursorLine},
    Directory {GruvboxRedBold},
    DiffAdd {fg = green, bg = bg0, gui = styles.invert_signs},
    DiffChange {fg = aqua, bg = bg0, gui = styles.invert_signs},
    DiffDelete {fg = red, bg = bg0, gui = styles.invert_signs},
    DiffText {fg = yellow, bg = bg0, gui = styles.invert_signs},
    ErrorMsg {fg = bg0, bg = red, gui = styles.bold},
    VertSplit {fg = bg3, bg = vert_split},
    Folded {fg = gray, bg = bg1, gui = styles.italic_strings},
    FoldColumn {fg = gray, bg = bg1},
    SignColumn {bg = sign_column},
    IncSearch {fg = hls_cursor, bg = bg0, gui = styles.inverse},
    LineNr {fg = bg4, bg = number_column},
    CursorLineNr {fg = yellow, bg = bg1},
    MatchParen {bg = bg3, gui = styles.bold},
    ModeMsg {GruvboxYellowBold},
    MoreMsg {GruvboxYellowBold},
    NonText {GruvboxBg2},
    Normal {fg = fg1, bg = bg0},
    NormalFloat {Normal},
    NormalNC {Normal},
    Pmenu {fg = fg1, bg = bg2},
    PmenuSel {fg = bg2, bg = blue, gui = styles.bold},
    PmenuSbar {bg = bg2},
    PmenuThumb {bg = bg4},
    Question {GruvboxOrangeBold},
    QuickFixLine {fg = bg0, bg = yellow, gui = styles.bold},
    Search {fg = hls_highlight, bg = bg0, gui = styles.inverse},
    SpecialKey {GruvboxFg4},
    SpellRare {GruvboxPurpleUnderline},
    SpellBad {GruvboxRedUnderline},
    StatusLine {fg = bg2, bg = fg1, gui = styles.inverse},
    StatusLineNC {fg = bg1, bg = fg4, gui = styles.inverse},
    TabLineFill {fg = bg4, bg = bg1, gui = styles.invert_tabline},
    TabLine {fg = bg4, bg = bg1, gui = styles.invert_tabline},
    TabLineSel {fg = tabline_sel, bg = bg1, gui = styles.invert_tabline},
    Title {GruvboxGreenBold},
    Visual {bg = bg3, gui = styles.invert_selection},
    VisualNOS {Visual},
    WarningMsg {GruvboxRedBold},
    WildMenu {fg = blue, bg = bg2, gui = styles.bold},
    Constant {GruvboxPurple},
    Special {fg = special_string_fg, bg = special_string_bg, gui = special_string_gui},
    String {
      fg = improved_strings_fg,
      bg = improved_strings_bg,
      gui = improved_strings_gui,
    },
    Character {GruvboxPurple},
    Number {GruvboxPurple},
    Boolean {GruvboxPurple},
    Float {GruvboxPurple},
    Identifier {GruvboxBlue},
    Function {GruvboxGreenBold},
    Statement {GruvboxRed},
    Conditional {GruvboxRed},
    Repeat {GruvboxRed},
    Label {GruvboxRed},
    Exception {GruvboxRed},
    Keyword {GruvboxRed},
    Operator {GruvboxFg1},
    PreProc {GruvboxAqua},
    Include {GruvboxAqua},
    Define {GruvboxAqua},
    Macro {GruvboxAqua},
    PreCondit {GruvboxAqua},
    Type {GruvboxYellow},
    StorageClass {GruvboxOrange},
    Structure {GruvboxAqua},
    Typedef {GruvboxYellow},
    SpecialChar {GruvboxRed},
    Tag {GruvboxAquaBold},
    Delimiter {GruvboxFg0},
    Comment {fg = gray, gui = styles.italic_comments},
    Debug {GruvboxRed},
    Underlined {fg = blue, gui = styles.underline},
    Bold {gui = styles.bold},
    Italic {gui = styles.italic},
    Ignore {},
    Error {GruvboxRed, gui = styles.bold .. "," .. styles.underline},
    Todo {fg = fg0, gui = styles.bold .. "," .. styles.italic_comments},
  }
end)

return base_group
