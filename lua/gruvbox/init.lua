local lush = require("lush")
local convert = require("lush.hsl.convert")
local colors = require("gruvbox.colors")
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

-- global settings
local settings = {
  contrast_dark = "medium",
  contrart_light = "medium",
  bold = true,
  italic = true,
  undercurl = true,
  underline = true,
  inverse = true,
  improved_strings = false,
  improved_warnings = false,
  invert_signs = false,
  invert_selection = true,
  invert_tabline = false,
  italicize_comments = true,
  italicize_strings = false,
  invert_intend_guides = false,
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

local function tobool(val)
  if val == 0 or not val then
    return false
  end
  return true
end

-- styles check
if not tobool(vim.g.gruvbox_bold) then
  styles.bold = ""
end

if not tobool(vim.g.gruvbox_underline) then
  styles.underline = ""
end

if not tobool(vim.g.gruvbox_italic) then
  styles.italic = ""
end

if not tobool(vim.g.gruvbox_inverse) then
  styles.inverse = ""
end

if not tobool(vim.g.gruvbox_inverse) then
  styles.inverse = ""
end

if not tobool(vim.g.gruvbox_undercurl) then
  styles.undercurl = ""
end

-- set colors_name var
vim.g.colors_name = "gruvbox"

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

local invert_signs
if tobool(vim.g.gruvbox_invert_signs) then
  invert_signs = styles.inverse
end

local invert_selection = styles.inverse
if not tobool(vim.g.gruvbox_invert_selection) then
  invert_selection = "NONE"
end

local invert_tabline
if tobool(vim.g.gruvbox_invert_tabline) then
  invert_tabline = styles.inverse
end

local tabline_sel = green
if tobool(vim.g.gruvbox_tabline_sel) then
  tabline_sel = hsl(colors[vim.g.gruvbox_tabline_sel])
end

local italic_comments = styles.italic
if not tobool(vim.g.gruvbox_italicize_comments) then
  italic_comments = "NONE"
end

local italic_strings = "NONE"
if tobool(vim.g.gruvbox_italicize_strings) then
  italic_strings = styles.italic
end

local improved_strings_fg = fg1
local improved_strings_bg = bg1
local improved_strings_gui = italic_strings

local special_string_fg = orange
local special_string_bg = bg1
local special_string_gui = italic_strings

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

local groups = lush(function()
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

    GruvboxRedSign {fg = red, bg = sign_column, gui = invert_signs},
    GruvboxGreenSign {fg = green, bg = sign_column, gui = invert_signs},
    GruvboxYellowSign {fg = yellow, bg = sign_column, gui = invert_signs},
    GruvboxBlueSign {fg = blue, bg = sign_column, gui = invert_signs},
    GruvboxPurpleSign {fg = purple, bg = sign_column, gui = invert_signs},
    GruvboxAquaSign {fg = aqua, bg = sign_column, gui = invert_signs},
    GruvboxOrangeSign {fg = orange, bg = sign_column, gui = invert_signs},

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
    DiffAdd {fg = green, bg = bg0, gui = invert_signs},
    DiffChange {fg = aqua, bg = bg0, gui = invert_signs},
    DiffDelete {fg = red, bg = bg0, gui = invert_signs},
    DiffText {fg = yellow, bg = bg0, gui = invert_signs},
    ErrorMsg {fg = bg0, bg = red, gui = styles.bold},
    VertSplit {fg = bg3, bg = vert_split},
    Folded {fg = gray, bg = bg1, gui = italic_strings},
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
    TabLineFill {fg = bg4, bg = bg1, gui = invert_tabline},
    TabLine {fg = bg4, bg = bg1, gui = invert_tabline},
    TabLineSel {fg = tabline_sel, bg = bg1, gui = invert_tabline},
    Title {GruvboxGreenBold},
    Visual {bg = bg3, gui = invert_selection},
    VisualNOS {Visual},
    WarningMsg {GruvboxRedBold},
    WildMenu {fg = blue, bg = bg2, gui = styles.bold},
    Constant {GruvboxPurple},
    -- Special {fg = special_string_fg, bg = special_string_bg, gui = special_string_gui},
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
    Comment {fg = gray, gui = italic_comments},
    Debug {GruvboxRed},
    Underlined {fg = blue, gui = styles.underline},
    Bold {gui = styles.bold},
    Italic {gui = styles.italic},
    Ignore {},
    Error {GruvboxRed, gui = styles.bold .. "," .. styles.underline},
    Todo {fg = fg0, gui = styles.bold .. "," .. italic_comments},
    -- netrw
    netrwDir {GruvboxAqua},
    netrwClassify {GruvboxAqua},
    netrwLink {GruvboxGray},
    netrwSymLink {GruvboxFg1},
    netrwExe {GruvboxYellow},
    netrwComment {GruvboxGray},
    netrwList {GruvboxBlue},
    netrwHelpCmd {GruvboxAqua},
    netrwCmdSep {GruvboxFg3},
    netrwVersion {GruvboxGreen},
    -- golang
    goDirective {GruvboxAqua},
    goConstants {GruvboxPurple},
    goDeclaration {GruvboxRed},
    goDeclType {GruvboxBlue},
    goBuiltins {GruvboxOrange},
    -- java
    javaAnnotation {GruvboxBlue},
    javaDocTags {GruvboxAqua},
    javaCommentTitle {Comment},
    javaParen {GruvboxFg3},
    javaParen1 {GruvboxFg3},
    javaParen2 {GruvboxFg3},
    javaParen3 {GruvboxFg3},
    javaParen4 {GruvboxFg3},
    javaParen5 {GruvboxFg3},
    javaOperator {GruvboxOrange},
    -- xml
    xmlTag {GruvboxAquaBold},
    xmlEndTag {GruvboxAquaBold},
    xmlTagName {GruvboxBlue},
    xmlEqual {GruvboxBlue},
    docbkKeyword {GruvboxAquaBold},
    xmlDocTypeDecl {GruvboxGray},
    xmlDocTypeKeyword {GruvboxPurple},
    xmlCdataStart {GruvboxGray},
    xmlCdataCdata {GruvboxPurple},
    dtdFunction {GruvboxGray},
    dtdTagName {GruvboxPurple},
    xmlAttrib {GruvboxOrange},
    xmlProcessingDelim {GruvboxGray},
    dtdParamEntityPunct {GruvboxGray},
    dtdParamEntityDPunct {GruvboxGray},
    xmlAttribPunct {GruvboxGray},
    xmlEntity {GruvboxRed},
    xmlEntityPunct {GruvboxRed},
    -- viml
    vimNotation {GruvboxOrange},
    vimBracket {GruvboxOrange},
    vimMapModKey {GruvboxOrange},
    vimFuncSID {GruvboxFg3},
    vimSetSep {GruvboxFg3},
    vimSep {GruvboxFg3},
    vimContinue {GruvboxFg3},
    -- c
    cOperator {GruvboxPurple},
    cppOperator {GruvboxPurple},
    cStructure {GruvboxOrange},
    -- python
    pythonBuiltin {GruvboxOrange},
    pythonBuiltinObj {GruvboxOrange},
    pythonBuiltinFunc {GruvboxOrange},
    pythonFunction {GruvboxAqua},
    pythonDecorator {GruvboxRed},
    pythonInclude {GruvboxBlue},
    pythonImport {GruvboxBlue},
    pythonRun {GruvboxBlue},
    pythonCoding {GruvboxBlue},
    pythonOperator {GruvboxRed},
    pythonException {GruvboxRed},
    pythonExceptions {GruvboxPurple},
    pythonBoolean {GruvboxPurple},
    pythonDot {GruvboxFg3},
    pythonConditional {GruvboxRed},
    pythonRepeat {GruvboxRed},
    pythonDottedName {GruvboxGreenBold},
    -- clojure
    clojureKeyword {GruvboxBlue},
    clojureCond {GruvboxOrange},
    clojureSpecial {GruvboxOrange},
    clojureDefine {GruvboxOrange},
    clojureFunc {GruvboxYellow},
    clojureRepeat {GruvboxYellow},
    clojureCharacter {GruvboxAqua},
    clojureStringEscape {GruvboxAqua},
    clojureException {GruvboxRed},
    clojureRegexp {GruvboxAqua},
    clojureRegexpEscape {GruvboxAqua},
    clojureParen {GruvboxFg3},
    clojureAnonArg {GruvboxYellow},
    clojureVariable {GruvboxBlue},
    clojureMacro {GruvboxOrange},
    clojureMeta {GruvboxYellow},
    clojureDeref {GruvboxYellow},
    clojureQuote {GruvboxYellow},
    clojureUnquote {GruvboxYellow},
    clojureRegexpCharClass {fg = fg3, gui = styles.bold},
    clojureRegexpMod {clojureRegexpCharClass},
    clojureRegexpQuantifier {clojureRegexpCharClass},
    -- html
    htmlTag {GruvboxAquaBold},
    htmlEndTag {GruvboxAquaBold},
    htmlTagName {GruvboxBlue},
    htmlArg {GruvboxOrange},
    htmlScriptTag {GruvboxPurple},
    htmlTagN {GruvboxFg1},
    htmlSpecialTagName {GruvboxBlue},
    htmlSpecialChar {GruvboxRed},
    htmlLink {fg = fg4, gui = styles.underline},
    htmlBold {fg = fg1, gui = styles.bold},
    htmlBoldUnderline {fg = fg1, gui = styles.bold .. "," .. styles.underline},
    htmlBoldItalic {fg = fg1, gui = styles.bold .. "," .. italic_strings},
    htmlBoldUnderlineItalic {
      fg = fg1,
      gui = styles.bold .. "," .. styles.underline .. "," .. italic_strings,
    },
    htmlItalic {fg = fg1, gui = italic_strings},
    -- special diffs
    diffAdded {GruvboxGreen},
    diffRemoved {GruvboxRed},
    diffChanged {GruvboxAqua},
    diffFile {GruvboxOrange},
    diffNewFile {GruvboxYellow},
    diffLine {GruvboxBlue},
    -- css
    cssBraces {GruvboxBlue},
    cssFunctionName {GruvboxYellow},
    cssIdentifier {GruvboxOrange},
    cssClassName {GruvboxGreen},
    cssColor {GruvboxBlue},
    cssSelectorOp {GruvboxBlue},
    cssSelectorOp2 {GruvboxBlue},
    cssImportant {GruvboxGreen},
    cssVendor {GruvboxFg1},
    cssTextProp {GruvboxAqua},
    cssAnimationProp {GruvboxAqua},
    cssUIProp {GruvboxYellow},
    cssTransformProp {GruvboxAqua},
    cssTransitionProp {GruvboxAqua},
    cssPrintProp {GruvboxAqua},
    cssPositioningProp {GruvboxYellow},
    cssBoxProp {GruvboxAqua},
    cssFontDescriptorProp {GruvboxAqua},
    cssFlexibleBoxProp {GruvboxAqua},
    cssBorderOutlineProp {GruvboxAqua},
    cssBackgroundProp {GruvboxAqua},
    cssMarginProp {GruvboxAqua},
    cssListProp {GruvboxAqua},
    cssTableProp {GruvboxAqua},
    cssFontProp {GruvboxAqua},
    cssPaddingProp {GruvboxAqua},
    cssDimensionProp {GruvboxAqua},
    cssRenderProp {GruvboxAqua},
    cssColorProp {GruvboxAqua},
    cssGeneratedContentProp {GruvboxAqua},
    -- js
    javaScriptBraces {GruvboxFg1},
    javaScriptFunction {GruvboxAqua},
    javaScriptIdentifier {GruvboxRed},
    javaScriptMember {GruvboxBlue},
    javaScriptNumber {GruvboxPurple},
    javaScriptNull {GruvboxPurple},
    javaScriptParens {GruvboxFg3},
    javascriptImport {GruvboxAqua},
    javascriptExport {GruvboxAqua},
    javascriptClassKeyword {GruvboxAqua},
    javascriptClassExtends {GruvboxAqua},
    javascriptDefault {GruvboxAqua},
    javascriptClassName {GruvboxYellow},
    javascriptClassSuperName {GruvboxYellow},
    javascriptGlobal {GruvboxYellow},
    javascriptEndColons {GruvboxFg1},
    javascriptFuncArg {GruvboxFg1},
    javascriptGlobalMethod {GruvboxFg1},
    javascriptNodeGlobal {GruvboxFg1},
    javascriptBOMWindowProp {GruvboxFg1},
    javascriptArrayMethod {GruvboxFg1},
    javascriptArrayStaticMethod {GruvboxFg1},
    javascriptCacheMethod {GruvboxFg1},
    javascriptDateMethod {GruvboxFg1},
    javascriptMathStaticMethod {GruvboxFg1},
    javascriptProp {GruvboxFg1},
    javascriptURLUtilsProp {GruvboxFg1},
    javascriptBOMNavigatorProp {GruvboxFg1},
    javascriptDOMDocMethod {GruvboxFg1},
    javascriptDOMDocProp {GruvboxFg1},
    javascriptBOMLocationMethod {GruvboxFg1},
    javascriptBOMWindowMethod {GruvboxFg1},
    javascriptStringMethod {GruvboxFg1},
    javascriptVariable {GruvboxOrange},
    javascriptClassSuper {GruvboxOrange},
    javascriptFuncKeyword {GruvboxAqua},
    javascriptAsyncFunc {GruvboxAqua},
    javascriptClassStatic {GruvboxOrange},
    javascriptOperator {GruvboxRed},
    javascriptForOperator {GruvboxRed},
    javascriptYield {GruvboxRed},
    javascriptExceptions {GruvboxRed},
    javascriptMessage {GruvboxRed},
    javascriptTemplateSB {GruvboxAqua},
    javascriptTemplateSubstitution {GruvboxFg1},
    javascriptLabel {GruvboxFg1},
    javascriptObjectLabel {GruvboxFg1},
    javascriptPropertyName {GruvboxFg1},
    javascriptLogicSymbols {GruvboxFg1},
    javascriptArrowFunc {GruvboxYellow},
    javascriptDocParamName {GruvboxFg4},
    javascriptDocTags {GruvboxFg4},
    javascriptDocNotation {GruvboxFg4},
    javascriptDocParamType {GruvboxFg4},
    javascriptDocNamedParamType {GruvboxFg4},
    javascriptBrackets {GruvboxFg1},
    javascriptDOMElemAttrs {GruvboxFg1},
    javascriptDOMEventMethod {GruvboxFg1},
    javascriptDOMNodeMethod {GruvboxFg1},
    javascriptDOMStorageMethod {GruvboxFg1},
    javascriptHeadersMethod {GruvboxFg1},
    javascriptAsyncFuncKeyword {GruvboxRed},
    javascriptAwaitFuncKeyword {GruvboxRed},
    jsClassKeyword {GruvboxAqua},
    jsExtendsKeyword {GruvboxAqua},
    jsExportDefault {GruvboxAqua},
    jsTemplateBraces {GruvboxAqua},
    jsGlobalNodeObjects {GruvboxBlue},
    jsGlobalObjects {GruvboxBlue},
    jsObjectKey {GruvboxGreenBold},
    jsFunction {GruvboxAqua},
    jsFuncCall {GruvboxBlue},
    jsFuncParens {GruvboxFg3},
    jsParens {GruvboxFg3},
    jsNull {GruvboxPurple},
    jsUndefined {GruvboxPurple},
    jsClassDefinition {GruvboxYellow},
    jsOperatorKeyword {GruvboxRed},
    -- typescript
    typescriptReserved {GruvboxAqua},
    typescriptLabel {GruvboxAqua},
    typescriptFuncKeyword {GruvboxAqua},
    typescriptIdentifier {GruvboxOrange},
    typescriptBraces {GruvboxFg1},
    typescriptEndColons {GruvboxFg1},
    typescriptDOMObjects {GruvboxFg1},
    typescriptAjaxMethods {GruvboxFg1},
    typescriptLogicSymbols {GruvboxFg1},
    typescriptDocSeeTag {Comment},
    typescriptDocParam {Comment},
    typescriptDocTags {Comment},
    typescriptGlobalObjects {GruvboxFg1},
    typescriptParens {GruvboxFg3},
    typescriptOpSymbols {GruvboxFg3},
    typescriptHtmlElemProperties {GruvboxFg1},
    typescriptNull {GruvboxPurple},
    typescriptInterpolationDelimiter {GruvboxAqua},
    -- jsx
    jsxTagName {GruvboxAqua},
    jsxComponentName {GruvboxGreen},
    jsxCloseString {GruvboxFg4},
    jsxAttrib {GruvboxYellow},
    jsxEqual {GruvboxAqua},
    -- purescript
    purescriptModuleKeyword {GruvboxAqua},
    purescriptModuleName {GruvboxFg1},
    purescriptWhere {GruvboxAqua},
    purescriptDelimiter {GruvboxFg4},
    purescriptType {GruvboxFg1},
    purescriptImportKeyword {GruvboxAqua},
    purescriptHidingKeyword {GruvboxAqua},
    purescriptAsKeyword {GruvboxAqua},
    purescriptStructure {GruvboxAqua},
    purescriptOperator {GruvboxBlue},
    purescriptTypeVar {GruvboxFg1},
    purescriptConstructor {GruvboxFg1},
    purescriptFunction {GruvboxFg1},
    purescriptConditional {GruvboxOrange},
    purescriptBacktick {GruvboxOrange},
    -- coffeescript
    coffeeExtendedOp {GruvboxFg3},
    coffeeSpecialOp {GruvboxFg3},
    coffeeCurly {GruvboxOrange},
    coffeeParen {GruvboxFg3},
    coffeeBracket {GruvboxOrange},
    -- ruby
    rubyStringDelimiter {GruvboxGreen},
    rubyInterpolationDelimiter {GruvboxAqua},
    -- obj-c
    objcTypeModifier {GruvboxRed},
    objcDirective {GruvboxBlue},
    -- moonscript
    moonSpecialOp {GruvboxFg3},
    moonExtendedOp {GruvboxFg3},
    moonFunction {GruvboxFg3},
    moonObject {GruvboxYellow},
    -- elixir
    elixirDocString {Comment},
    elixirStringDelimiter {GruvboxGreen},
    elixirInterpolationDelimiter {GruvboxAqua},
    elixirModuleDeclaration {GruvboxYellow},
    -- scala
    scalaNameDefinition {GruvboxFg1},
    scalaCaseFollowing {GruvboxFg1},
    scalaCapitalWord {GruvboxFg1},
    scalaTypeExtension {GruvboxFg1},
    scalaKeyword {GruvboxRed},
    scalaKeywordModifier {GruvboxRed},
    scalaSpecial {GruvboxAqua},
    scalaOperator {GruvboxFg1},
    scalaTypeDeclaration {GruvboxYellow},
    scalaTypeTypePostDeclaration {GruvboxYellow},
    scalaInstanceDeclaration {GruvboxFg1},
    scalaInterpolation {GruvboxAqua},
    -- markdown
    markdownItalic {fg = fg3, gui = italic_strings},
    markdownH1 {GruvboxGreenBold},
    markdownH2 {markdownH1},
    markdownH3 {GruvboxYellowBold},
    markdownH4 {markdownH3},
    markdownH5 {GruvboxYellow},
    markdownH6 {markdownH5},
    markdownCode {GruvboxAqua},
    markdownCodeBlock {GruvboxAqua},
    markdownCodeDelimiter {GruvboxAqua},
    markdownBlockquote {GruvboxGray},
    markdownListMarker {GruvboxGray},
    markdownOrderedListMarker {GruvboxGray},
    markdownRule {GruvboxGray},
    markdownHeadingRule {GruvboxGray},
    markdownUrlDelimiter {GruvboxFg3},
    markdownLinkDelimiter {GruvboxFg3},
    markdownLinkTextDelimiter {GruvboxFg3},
    markdownHeadingDelimiter {GruvboxOrange},
    markdownUrl {GruvboxPurple},
    markdownUrlTitleDelimiter {GruvboxGreen},
    markdownLinkText {fg = gray, gui = styles.underline},
    markdownIdDeclaration {markdownLinkText},
    -- haskell
    haskellType {GruvboxBlue},
    haskellIdentifier {GruvboxAqua},
    haskellSeparator {GruvboxFg4},
    haskellDelimiter {GruvboxOrange},
    haskellOperators {GruvboxPurple},
    haskellBacktick {GruvboxOrange},
    haskellStatement {GruvboxPurple},
    haskellConditional {GruvboxPurple},
    haskellLet {GruvboxRed},
    haskellDefault {GruvboxRed},
    haskellWhere {GruvboxRed},
    haskellBottom {GruvboxRedBold},
    haskellImportKeywords {GruvboxPurpleBold},
    haskellDeclKeyword {GruvboxOrange},
    haskellDecl {GruvboxOrange},
    haskellDeriving {GruvboxPurple},
    haskellAssocType {GruvboxAqua},
    haskellNumber {GruvboxAqua},
    haskellPragma {GruvboxRedBold},
    haskellTH {GruvboxAquaBold},
    haskellForeignKeywords {GruvboxGreen},
    haskellKeyword {GruvboxRed},
    haskellFloat {GruvboxAqua},
    haskellInfix {GruvboxPurple},
    haskellQuote {GruvboxGreenBold},
    haskellShebang {GruvboxYellowBold},
    haskellLiquid {GruvboxPurpleBold},
    haskellQuasiQuoted {GruvboxBlueBold},
    haskellRecursiveDo {GruvboxPurple},
    haskellQuotedType {GruvboxRed},
    haskellPreProc {GruvboxFg4},
    haskellTypeRoles {GruvboxRedBold},
    haskellTypeForall {GruvboxRed},
    haskellPatternKeyword {GruvboxBlue},
    -- json
    jsonKeyword {GruvboxGreen},
    jsonQuote {GruvboxGreen},
    jsonBraces {GruvboxFg1},
    jsonString {GruvboxFg1},
    -- mail.vim
    mailQuoted1 {GruvboxAqua},
    mailQuoted2 {GruvboxPurple},
    mailQuoted3 {GruvboxYellow},
    mailQuoted4 {GruvboxGreen},
    mailQuoted5 {GruvboxRed},
    mailQuoted6 {GruvboxOrange},
    mailSignature {Comment},
    -- csharp
    csBraces {GruvboxFg1},
    csEndColon {GruvboxFg1},
    csLogicSymbols {GruvboxFg1},
    csParens {GruvboxFg3},
    csOpSymbols {GruvboxFg3},
    csInterpolationDelimiter {GruvboxFg3},
    csInterpolationAlignDel {GruvboxAquaBold},
    csInterpolationFormat {GruvboxAqua},
    csInterpolationFormatDel {GruvboxAquaBold},
    -- rust
    rustSigil {GruvboxOrange},
    rustEscape {GruvboxAqua},
    rustStringContinuation {GruvboxAqua},
    rustEnum {GruvboxAqua},
    rustStructure {GruvboxAqua},
    rustModPathSep {GruvboxFg2},
    rustCommentLineDoc {Comment},
    rustDefault {GruvboxAqua},
    -- ocaml
    ocamlOperator {GruvboxFg1},
    ocamlKeyChar {GruvboxOrange},
    ocamlArrow {GruvboxOrange},
    ocamlInfixOpKeyword {GruvboxRed},
    ocamlConstructor {GruvboxOrange},
    -- lua
    luaIn {GruvboxRed},
    luaFunction {GruvboxAqua},
    luaTable {GruvboxOrange},
    -- LSP
    LspDiagnosticsDefaultError {GruvboxRed},
    LspDiagnosticsSignError {GruvboxRedSign},
    LspDiagnosticsUnderlineError {GruvboxRedUnderline},
    LspDiagnosticsDefaultWarning {GruvboxYellow},
    LspDiagnosticsSignWarning {GruvboxYellowSign},
    LspDiagnosticsUnderlineWarning {GruvboxYellowUnderline},
    LspDiagnosticsDefaultInformation {GruvboxBlue},
    LspDiagnosticsSignInformation {GruvboxBlueSign},
    LspDiagnosticsUnderlineInformation {GruvboxBlueUnderline},
    LspDiagnosticsDefaultHint {GruvboxAqua},
    LspDiagnosticsSignHint {GruvboxAquaSign},
    LspDiagnosticsUnderlineHint {GruvboxAquaUnderline},
    LspReferenceRead {GruvboxYellowBold},
    LspReferenceText {GruvboxYellowBold},
    LspReferenceWrite {GruvboxYellowBold},
    -- signature
    SignatureMarkText {GruvboxBlueSign},
    SignatureMarkerText {GruvboxPurpleSign},
    -- gitcommit
    gitcommitSelectedFile {GruvboxGreen},
    gitcommitDiscardedFile {GruvboxRed},
    -- nvim-treesitter
    TSNone {},
    TSError {Error},
    TSTitle {Title},
    TSLiteral {String},
    TSURI {Underlined},
    TSVariable {},
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
    TSAnnotation {PreProc},
    TSAttribute {PreProc},
    TSNamespace {Include},
    TSConditional {Conditional},
    TSRepeat {Repeat},
    TSLabel {Label},
    TSOperator {Operator},
    TSKeyword {Keyword},
    TSKeywordFunction {Keyword},
    TSKeywordOperator {TSOperator},
    TSException {Exception},
    TSType {Type},
    TSTypeBuiltin {Type},
    TSInclude {Include},
    TSVariableBuiltin {Special},
    TSText {TSNone},
    TSStrong {gui = styles.bold},
    TSEmphasis {gui = italic_strings},
    TSUnderline {gui = styles.underline},
    -- telescope.nvim
    TelescopeSelection {GruvboxOrangeBold},
    TelescopeSlectionCaret {GruvboxRed},
    TelescopeMultiSelection {GruvboxGray},
    TelescopeNormal {GruvboxFg1},
    TelescopeBorder {TelescopeNormal},
    TelescopePromptBorder {TelescopeNormal},
    TelescopeResultsBorder {TelescopeNormal},
    TelescopePreviewBorder {TelescopeNormal},
    TelescopeMatching {GruvboxBlue},
    TelescopePromptPrefix {GruvboxRed},
    TelescopePrompt {TelescopeNormal},
    LspSagaDiagnosticBorder {NormalNC},
    LspSagaDiagnosticHeader {GruvboxRed},
    LspSagaDiagnosticTruncateLine {NormalNC},
    LspFloatWinBorder {NormalNC},
    LspSagaBorderTitle {Title},
    TargetWord {Error},
    ReferencesCount {Title},
    ReferencesIcon {Special},
    DefinitionCount {Title},
    TargetFileName {Comment},
    DefinitionIcon {Special},
    ProviderTruncateLine {NormalNC},
    SagaShadow {GruvboxBg0},
    LspSagaFinderSelection {Search},
    DiagnosticTruncateLine {NormalNC},
    DiagnosticError {LspDiagnosticsDefaultError},
    DiagnosticWarning {LspDiagnosticsDefaultWarning},
    DiagnosticInformation {LspDiagnosticsDefaultInformation},
    DiagnosticHint {LspDiagnosticsDefaultHint},
    DefinitionPreviewTitle {Title},
    LspSagaShTruncateLine {NormalNC},
    LspSagaDocTruncateLine {NormalNC},
    LineDiagTuncateLine {NormalNC},
    LspSagaCodeActionTitle {Title},
    LspSagaCodeActionTruncateLine {NormalNC},
    LspSagaCodeActionContent {Normal},
    LspSagaRenamePromptPrefix {GruvboxFg2},
    LspSagaRenameBorder {gui = styles.bold},
    LspSagaHoverBorder {gui = styles.bold},
    LspSagaSignatureHelpBorder {gui = styles.bold},
    LspSagaCodeActionBorder {gui = styles.bold},
    LspSagaAutoPreview {},
    LspSagaDefPreviewBorder {gui = styles.bold},
    LspLinesDiagBorder {gui = styles.bold},
    -- vim-startify
    StartifyBracket {Delimiter},
    StartifyFile {Identifier},
    StartifyNumber {Number},
    StartifyPath {Directory},
    StartifySlash {Delimiter},
    StartifySection {Statement},
    StartifySpecial {Comment},
    StartifyHeader {Title},
    StartifyFooter {Title},
    StartifyVar {StartifyPath},
    StartifySelect {Title},
    -- vim-signify
    SignifySignAdd {GruvboxGreenSign},
    SignifySignChange {GruvboxAquaSign},
    SignifySignDelete {GruvboxRedSign},
    -- syntastic
    SyntasticError {GruvboxRedUnderline},
    SyntasticWarning {GruvboxYellowUnderline},
    SyntasticErrorSign {GruvboxRedSign},
    SyntasticWarningSign {GruvboxYellowSign},
    -- termdebug
    debugPC {bg = colors.faded_blue},
    debugBreakpoint {GruvboxRedSign},
    -- vim-dirvish
    DirvishPathTail {GruvboxAqua},
    DirvishArg {GruvboxYellow},
    -- -- nerdtree 
    NERDTreeDir {GruvboxAqua},
    NERDTreeDirSlash {GruvboxAqua},
    NERDTreeOpenable {GruvboxOrange},
    NERDTreeClosable {GruvboxOrange},
    NERDTreeFile {GruvboxFg1},
    NERDTreeExecFile {GruvboxYellow},
    NERDTreeUp {GruvboxGray},
    NERDTreeCWD {GruvboxGreen},
    NERDTreeHelp {GruvboxFg1},
    NERDTreeToggleOn {GruvboxGreen},
    NERDTreeToggleOff {GruvboxRed},
    -- coc.nvim
    CocErrorSign {GruvboxRedSign},
    CocWarningSign {GruvboxOrangeSign},
    CocInfoSign {GruvboxBlueSign},
    CocHintSign {GruvboxAquaSign},
    CocErrorFloat {GruvboxRed},
    CocWarningFloat {GruvboxOrange},
    CocInfoFloat {GruvboxBlue},
    CocHintFloat {GruvboxAqua},
    CocDiagnosticsError {GruvboxRed},
    CocDiagnosticsWarning {GruvboxOrange},
    CocDiagnosticsInfo {GruvboxBlue},
    CocDiagnosticsHint {GruvboxAqua},
    CocSelectedText {GruvboxRed},
    CocCodeLens {GruvboxGray},
    CocErrorHighlight {GruvboxRedUnderline},
    CocWarningHighlight {GruvboxOrangeUnderline},
    CocInfoHighlight {GruvboxBlueUnderline},
    CocHintHighlight {GruvboxAquaUnderline},
    -- ale.vim
    ALEError {GruvboxRedUnderline},
    ALEWarning {GruvboxYellowUnderline},
    ALEInfo {GruvboxBlueUnderline},
    ALEErrorSign {GruvboxRedSign},
    ALEWarningSign {GruvboxYellowSign},
    ALEInfoSign {GruvboxBlueSign},
    ALEVirtualTextError {GruvboxRed},
    ALEVirtualTextWarning {GruvboxYellow},
    ALEVirtualTextInfo {GruvboxBlue},
    -- vim-buftabline
    BufTabLineCurrent {TabLineSel},
    BufTabLineActive {PmenuSel},
    BufTabLineHidden {TabLine},
    BufTabLineFill {TabLineFill},
    BufTabLineModifiedCurrent {BufTabLineCurrent},
    BufTabLineModifiedActive {BufTabLineActive},
    BufTabLineModifiedHidden {BufTabLineHidden},
    -- ctrlP 
    CtrlPMatch {Identifier},
    CtrlPNoEntries {Error},
    CtrlPPrtBase {Comment},
    CtrlPPrtCursor {Constant},
    CtrlPLinePre {fg = bg2},
    CtrlPMode1 {Character},
    CtrlPMode2 {LineNr},
    CtrlPStats {Function},
    -- fzf.vim
    Fzf1 {fg = blue, bg = bg1},
    Fzf2 {fg = orange, bg = bg1},
    Fzf3 {fg = fg4, bg = bg1},
    ShowMarksHLl {GruvboxBlueSign},
    ShowMarksHLu {GruvboxBlueSign},
    ShowMarksHLo {GruvboxBlueSign},
    ShowMarksHLm {GruvboxBlueSign},
    -- git-gutter
    GitGutterAdd {GruvboxGreenSign},
    GitGutterChange {GruvboxAquaSign},
    GitGutterDelete {GruvboxRedSign},
    GitGutterChangeDelete {GruvboxAquaSign},
  }
end)
return groups
