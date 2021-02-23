local lush = require("lush")
local hsl = lush.hsl
-- gruvbox palette
local colors = {
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
}
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
local sign_column = bg1
local gray = colors.gray

-- global settings
local settings = {
  contrast_dark = "medium",
  contrart_light = "medium",
  bold = true,
  italic = true,
  undercurl = true,
  underline = true,
  improved_strings = false,
  improved_warnings = false,
  invert_signs = false,
  invert_selection = true,
  invert_tabline = false,
  italicize_comments = true,
  italicize_strings = false,
}

local styles = {
  italic = "italic",
  inverse = "inverse",
  bold = "bold",
  undercurl = "undercurl",
  underline = "underline",
}

-- setting default values
for k, val in pairs(settings) do
  local key = "gruvbox_" .. k
  if vim.g[key] == nil then
    vim.g[key] = val
  end
end

-- handle light/dark contrast settings
local bg = vim.o.background
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
  hls_cursor = colors[vim.g.gruvbox_hls_cursor]
end

local hls_highlight = yellow
if vim.g.gruvbox_hls_cursor ~= nil then
  hls_cursor = colors[vim.g.gruvbox_hls_highlight]
end

local number_column
if vim.g.gruvbox_number_column ~= nil then
  number_column = hsl(colors[vim.g.gruvbox_number_column])
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

local tabline_sel = green
if vim.g.gruvbox_tabline_sel then
  tabline_sel = colors[vim.g.gruvbox_tabline_sel]
end

local italic_comments = settings.italic
if not vim.g.gruvbox_italicize_comments then
  italic_comments = nil
end

local italic_strings
if vim.g.gruvbox_italicize_strings then
  italic_strings = styles.italic
end

local special = {fg = hsl(orange), bg = hsl(bg1), gui = italic_strings}
local special_string = {fg = hsl(fg1), bg = hsl(bg1), italic_strings}
if not vim.g.gruvbox_improved_strings then
  special = {fg = hsl(orange)}
  special_string = {fg = hsl(green), gui = italic_strings}
end

local theme = lush(function()
  return {
    -- EndOfBuffer  { },
    -- TermCursor   { },
    -- TermCursorNC { },
    -- Substitute   { },
    -- MsgArea      { },
    -- MsgSeparator { },
    -- Whitespace   { },
    -- Base groups
    ColorColumn {bg = hsl(bg1)},
    Conceal {bg = hsl(blue)},
    Cursor {gui = styles.inverse},
    lCursor {Cursor},
    CursorIM {Cursor},
    CursorColumn {bg = bg1},
    CursorLine {CursorColumn},
    Directory {fg = hsl(green), gui = styles.bold},
    DiffAdd {fg = hsl(green), bg = hsl(bg1), gui = invert_signs},
    DiffChange {fg = hsl(aqua), bg = hsl(bg1), gui = invert_signs},
    DiffDelete {fg = hsl(red), bg = hsl(bg1), gui = invert_signs},
    DiffText {fg = hsl(yellow), bg = hsl(bg1), gui = invert_signs},
    ErrorMsg {fg = hsl(bg0), bg = hsl(red), gui = styles.bold},
    VertSplit {fg = hsl(bg3), bgb = hsl(vert_split)},
    Folded {fg = hsl(gray), bg = hsl(bg1), gui = styles.italic},
    FoldColumn {fg = hsl(gray), bg = hsl(bg1)},
    SignColumn {bg = hsl(sign_column)},
    IncSearch {fg = hsl(hls_cursor), bg = hsl(bg0), gui = styles.inverse},
    LineNr {fg = hsl(bg4), bg = number_column},
    CursorLineNr {fg = hsl(yellow), bg = hsl(bg1)},
    MatchParen {bg = hsl(bg3), gui = styles.bold},
    ModeMsg {fg = hsl(yellow), gui = styles.bold},
    MoreMsg {fg = hsl(yellow), gui = styles.bold},
    NonText {fg = hsl(bg2)},
    Normal {fg = hsl(fg0), bg = hsl(bg0)},
    NormalFloat {Normal},
    NormalNC {Normal},
    Pmenu {fg = hsl(fg1), bg = hsl(bg2)},
    PmenuSel {fg = hsl(bg2), bg = hsl(blue), gui = styles.bold},
    PmenuSbar {bg = hsl(bg2)},
    PmenuThumb {bg = hsl(bg4)},
    Question {fg = hsl(orange), gui = styles.bold},
    QuickFixLine {fg = hsl(fg0), bg = hsl(yellow), gui = styles.bold},
    Search {fg = hsl(hls_highlight), bg = hsl(bg0), gui = styles.inverse},
    SpecialKey {fg = hsl(fg4)},
    SpellRare {gui = styles.undercurl, sep = hsl(purple)},
    SpellBad {fg = hsl(red), gui = styles.underline},
    StatusLine {fg = hsl(bg2), bg = hsl(fg1), gui = styles.inverse},
    StatusLineNC {fg = hsl(bg1), bg = hsl(fg4), gui = styles.inverse},
    TabLine {fg = hsl(bg4), bg = hsl(bg1), gui = invert_tabline},
    TabLineFill {fg = hsl(bg4), bg = hsl(bg1), gui = invert_tabline},
    TabLineSel {fg = hsl(tabline_sel), bg = hsl(bg1), gui = invert_tabline},
    Title {fg = hsl(green), gui = styles.bold},
    Visual {bg = hsl(bg3), gui = invert_selection},
    VisualNOS {bg = hsl(bg3), gui = invert_selection},
    WarningMsg {fg = hsl(red), gui = styles.bold},
    WildMenu {fg = hsl(blue), bg = hsl(bg2), gui = styles.bold},
    Constant {fg = hsl(purple)},
    String {unpack(special_string)},
    Character {fg = hsl(purple)},
    Number {Character},
    Boolean {Character},
    Float {Character},
    Identifier {fg = hsl(blue)},
    Function {fg = hsl(green), gui = styles.bold},
    Statement {fg = hsl(red)},
    Conditional {fg = hsl(red)},
    Repeat {fg = hsl(red)},
    Label {fg = hsl(red)},
    Keyword {fg = hsl(red)},
    Exception {fg = hsl(red)},
    Operator {fg = hsl(fg1)},
    PreProc {fg = hsl(aqua)},
    Include {fg = hsl(aqua)},
    Define {fg = hsl(aqua)},
    Macro {fg = hsl(aqua)},
    PreCondit {fg = hsl(aqua)},
    Type {fg = hsl(yellow)},
    StorageClass {fg = hsl(orange)},
    Structure {fg = hsl(aqua)},
    Typedef {fg = hsl(yellow)},
    Special {unpack(special)},
    SpecialChar {fg = hsl(red)},
    Tag {fg = hsl(aqua), gui = styles.bold},
    Delimiter {fg = hsl(fg0)},
    SpecialComment {fg = hsl(gray), gui = styles.italic},
    Debug {fg = hsl(red)},
    Underlined {gui = styles.underline},
    Bold {gui = styles.bold},
    Italic {gui = styles.italic},
    Ignore {},
    Error {fg = hsl(red), gui = styles.bold .. "," .. styles.underline}, -- TODO: check if we have some abstraction to merge two styles
    Todo {fg = hsl(fg0), gui = styles.bold .. "," .. styles.italic},

    -- LSP
    LspDiagnosticsError {Error},
    LspDiagnosticsErrorSign {fg = hsl(red), bg = hsl(sign_column), gui = invert_signs},
    LspDiagnosticsErrorFloating {LspDiagnosticsError},
    LspDiagnosticsWarning {fg = hsl(yellow)},
    LspDiagnosticsWarningSign {
      LspDiagnosticsWarning,
      bg = hsl(sign_column),
      gui = styles.undercurl,
      sp = hsl(yellow),
    },
    LspDiagnosticsWarningFloating {LspDiagnosticsWarning},
    LspDiagnosticsInformation {fg = hsl(blue)},
    LspDiagnosticsInformationSign {
      LspDiagnosticsInformation,
      bg = hsl(sign_column),
      gui = invert_signs,
    },
    LspDiagnosticsInformationFloating {LspDiagnosticsInformation},
    LspDiagnosticsHint {fg = hsl(aqua)},
    LspDiagnosticsHintSign {
      LspDiagnosticsHint,
      bg = hsl(sign_column),
      gui = invert_signs,
    },
    LspDiagnosticsHintFloating {LspDiagnosticsHint},

    -- Treesitter
    TSNone {},
    TSError {Error},
    TSPunctDelimiter {Delimiter},
    TSPunctBracket {Delimiter},
    TSPunctSpecial {Delimiter},
    TSConstant {Constant},
    TSConstBuiltin {Special},
    TSConstMacro {Define},
    TSString {String},
    TSStringRegex {String},
    TSStringEscape {SpecialChar},
    TSCharacter {Character},
    TSNumber {Number},
    TSBoolean {Boolean},
    TSFloat {Float},
    TSFunction {Function},
    TSFuncBuiltin {Special},
    TSFuncMacro {Macro},
    TSParameter {Identifier},
    TSParameterReference {TSParameter},
    TSMethod {Function},
    TSField {Identifier},
    TSProperty {Identifier},
    TSConstructor {Special},
    TSConditional {Conditional},
    TSRepeat {Repeat},
    TSLabel {Label},
    TSOperator {Operator},
    TSKeyword {Keyword},
    TSKeywordFunction {Keyword},
    TSException {Exception},
    TSType {Type},
    TSTypeBuiltin {Type},
    TSNamespace {Include},
    TSInclude {Include},
    TSAnnotation {PreProc},
    TSText {TSNone},
    TSStrong {gui = styles.bold},
    TSEmphasis {gui = styles.italic},
    TSUnderline {gui = styles.underline},
    TSTitle {Title},
    TSLiteral {String},
    TSURI {Underlined},
    TSVariable {Special},
    TSVariableBuiltin {Special},

    -- netrw
    netrwDir {fg = hsl(aqua)},
    netrwClassify {netrwDir},
    netrwLink {fg = hsl(gray)},
    netrwSymLink {fg = hsl(fg1)},
    netrwExe {fg = hsl(yellow)},
    netrwComment {netrwLink},
    netrwList {fg = hsl(blue)},
    netrwHelpCmd {netrwDir},
    netrwCmdSep {fg = hsl(fg3)},
    netrwVersion {fg = hsl(green)},

    -- vim-startify
    StartifyBracket {fg = hsl(fg3)},
    StartifyFile {fg = hsl(fg1)},
    StartifyNumber {fg = hsl(blue)},
    StartifyPath {fg = hsl(gray)},
    StartifySlash {StartifyPath},
    StartifySection {fg = hsl(yellow)},
    StartifySpecial {fg = hsl(bg2)},
    StartifyHeader {fg = hsl(orange)},
    StartifyFooter {fg = hsl(bg2)},

    -- vim-signify
    SignifySignAdd {fg = hsl(green), bg = hsl(sign_column), gui = invert_signs},
    SignifySignChange {fg = hsl(aqua), bg = hsl(sign_column), gui = invert_signs},
    SignifySignDelete {fg = hsl(red), bg = hsl(sign_column), gui = invert_signs},

    -- lua
    luaIn {fg = hsl(red)},
    luaFunction {fg = hsl(aqua)},
    luaTable {fg = hsl(orange)},

  }
end)

return theme

-- vi:nowrap
