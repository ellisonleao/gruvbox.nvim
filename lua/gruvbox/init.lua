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
  boldunderline = "bold,underline",
}

-- setting default values
for k, val in pairs(settings) do
  local key = "gruvbox_" .. k
  if vim.g[key] == nil then
    vim.g[key] = val
  end
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

local italic_comments = styles.italic
if not vim.g.gruvbox_italicize_comments then
  italic_comments = ""
end

local italic_strings = "NONE"
if vim.g.gruvbox_italicize_strings then
  italic_strings = styles.italic
end

local special = {fg = hsl(orange), bg = hsl(bg1), gui = italic_strings}
local special_string = {fg = hsl(fg1), bg = hsl(bg1), italic_strings}
if not vim.g.gruvbox_improved_strings then
  special = {fg = hsl(orange)}
  special_string = {fg = hsl(green), gui = italic_strings}
end

-- neovim terminal mode colors
vim.g.terminal_color_0 = bg0
vim.g.terminal_color_8 = gray
vim.g.terminal_color_1 = colors.neutral_red
vim.g.terminal_color_2 = red
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

local groups = lush(function()
  return {
    -- EndOfBuffer  { },
    -- TermCursor   { },
    -- TermCursorNC { },
    -- Substitute   { },
    -- MsgArea      { },
    -- MsgSeparator { },
    -- Whitespace   { },
    -- Base groups
    ColorColumn {bg = hsl(color_column)},
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
    Folded {fg = hsl(gray), bg = hsl(bg1), gui = italic_strings},
    FoldColumn {fg = hsl(gray), bg = hsl(bg1)},
    SignColumn {bg = hsl(sign_column)},
    IncSearch {fg = hsl(hls_cursor), bg = hsl(bg0), gui = styles.inverse},
    LineNr {fg = hsl(bg4), bg = number_column},
    CursorLineNr {fg = hsl(yellow), bg = hsl(bg1)},
    MatchParen {bg = hsl(bg3), gui = styles.bold},
    ModeMsg {fg = hsl(yellow), gui = styles.bold},
    MoreMsg {fg = hsl(yellow), gui = styles.bold},
    NonText {fg = hsl(bg2)},
    Normal {fg = hsl(fg1), bg = hsl(bg0)},
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
    TabLineSel {fg = hsl(tabline_sel), bg = hsl(bg0), gui = invert_tabline},
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
    Comment {fg = hsl(gray), gui = italic_comments},
    SpecialComment {fg = hsl(gray), gui = styles.bold .. "," .. italic_comments},
    Debug {fg = hsl(red)},
    Underlined {gui = styles.underline},
    Bold {gui = styles.bold},
    Italic {gui = styles.italic},
    Ignore {},
    Error {fg = hsl(red), gui = styles.boldunderline}, -- TODO: check if we have some abstraction to merge two styles
    Todo {fg = hsl(fg0), gui = styles.bold .. "," .. italic_comments},
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

    -- golang
    goDirective {fg = hsl(aqua)},
    goConstants {fg = hsl(purple)},
    goDeclaration {fg = hsl(red)},
    goDeclType {fg = hsl(blue)},
    goBuiltins {fg = hsl(orange)},

    -- java
    javaAnnotation {fg = hsl(blue)},
    javaDocTags {fg = hsl(aqua)},
    javaCommentTitle {SpecialComment},
    javaParen {fg = hsl(fg3)},
    javaParen1 {fg = hsl(fg3)},
    javaParen2 {fg = hsl(fg3)},
    javaParen3 {fg = hsl(fg3)},
    javaParen4 {fg = hsl(fg3)},
    javaParen5 {fg = hsl(fg3)},
    javaOperator {fg = hsl(orange)},

    -- xml
    xmlTag {fg = hsl(aqua), gui = styles.bold},
    xmlEndTag {fg = hsl(aqua), gui = styles.bold},
    xmlTagName {fg = hsl(blue)},
    xmlEqual {fg = hsl(blue)},
    docbkKeyword {fg = hsl(aqua), gui = styles.bold},
    xmlDocTypeDecl {fg = hsl(gray)},
    xmlDocTypeKeyword {fg = hsl(purple)},
    xmlCdataStart {fg = hsl(gray)},
    xmlCdataCdata {fg = hsl(purple)},
    dtdFunction {fg = hsl(gray)},
    dtdTagName {fg = hsl(purple)},
    xmlAttrib {fg = hsl(orange)},
    xmlProcessingDelim {fg = hsl(gray)},
    dtdParamEntityPunct {fg = hsl(gray)},
    dtdParamEntityDPunct {fg = hsl(gray)},
    xmlAttribPunct {fg = hsl(gray)},
    xmlEntity {fg = hsl(red)},
    xmlEntityPunct {fg = hsl(red)},

    -- viml
    vimNotation {fg = hsl(orange)},
    vimBracket {fg = hsl(orange)},
    vimMapModKey {fg = hsl(orange)},
    vimFuncSID {fg = hsl(fg3)},
    vimSetSep {fg = hsl(fg3)},
    vimSep {fg = hsl(fg3)},
    vimContinue {fg = hsl(fg3)},

    -- c
    cOperator {fg = hsl(purple)},
    cppOperator {fg = hsl(purple)},
    cStructure {fg = hsl(orange)},

    -- python
    pythonBuiltin {fg = hsl(orange)},
    pythonBuiltinObj {fg = hsl(orange)},
    pythonBuiltinFunc {fg = hsl(orange)},
    pythonFunction {fg = hsl(aqua)},
    pythonDecorator {fg = hsl(red)},
    pythonInclude {fg = hsl(blue)},
    pythonImport {fg = hsl(blue)},
    pythonRun {fg = hsl(blue)},
    pythonCoding {fg = hsl(blue)},
    pythonOperator {fg = hsl(red)},
    pythonException {fg = hsl(red)},
    pythonExceptions {fg = hsl(purple)},
    pythonBoolean {fg = hsl(purple)},
    pythonDot {fg = hsl(fg3)},
    pythonConditional {fg = hsl(red)},
    pythonRepeat {fg = hsl(red)},
    pythonDottedName {fg = hsl(green), gui = styles.bold},

    -- clojure
    clojureRegexpCharClass {fg = hsl(fg3), gui = styles.bold},
    clojureKeyword {fg = hsl(blue)},
    clojureCond {fg = hsl(orange)},
    clojureSpecial {fg = hsl(orange)},
    clojureDefine {fg = hsl(orange)},

    clojureFunc {fg = hsl(yellow)},
    clojureRepeat {fg = hsl(yellow)},
    clojureCharacter {fg = hsl(aqua)},
    clojureStringEscape {fg = hsl(aqua)},
    clojureException {fg = hsl(red)},

    clojureRegexp {fg = hsl(aqua)},
    clojureRegexpEscape {fg = hsl(aqua)},
    clojureRegexpMod {clojureRegexpCharClass},
    clojureRegexpQuantifier {clojureRegexpCharClass},

    clojureParen {fg = hsl(fg3)},
    clojureAnonArg {fg = hsl(yellow)},
    clojureVariable {fg = hsl(blue)},
    clojureMacro {fg = hsl(orange)},

    clojureMeta {fg = hsl(yellow)},
    clojureDeref {fg = hsl(yellow)},
    clojureQuote {fg = hsl(yellow)},
    clojureUnquote {fg = hsl(yellow)},

    -- html
    htmlTag {fg = hsl(aqua), gui = styles.bold},
    htmlEndTag {fg = hsl(aqua), gui = styles.bold},
    htmlTagName {fg = hsl(blue)},
    htmlArg {fg = hsl(orange)},
    htmlScriptTag {fg = hsl(purple)},
    htmlTagN {fg = hsl(fg1)},
    htmlSpecialTagName {fg = hsl(blue)},
    htmlSpecialChar {fg = hsl(red)},
    htmlLink {fg = hsl(fg4), gui = styles.underline},
    htmlBold {fg = hsl(fg1), gui = styles.bold},
    htmlBoldUnderline {fg = hsl(fg1), gui = styles.boldunderline},
    htmlBoldItalic {fg = hsl(fg1), gui = styles.bold .. "," .. italic_strings},
    htmlBoldUnderlineItalic {
      fg = hsl(fg1),
      gui = styles.boldunderline .. "," .. italic_strings,
    },
    htmlItalic {fg = hsl(fg1), gui = italic_strings},

    -- special diffs
    diffAdded {fg = hsl(green)},
    diffRemoved {fg = hsl(red)},
    diffChanged {fg = hsl(aqua)},
    diffFile {fg = hsl(orange)},
    diffNewFile {fg = hsl(yellow)},
    diffLine {fg = hsl(blue)},

    -- css
    cssBraces {fg = hsl(blue)},
    cssFunctionName {fg = hsl(yellow)},
    cssIdentifier {fg = hsl(orange)},
    cssClassName {fg = hsl(green)},
    cssColor {fg = hsl(blue)},
    cssSelectorOp {fg = hsl(blue)},
    cssSelectorOp2 {fg = hsl(blue)},
    cssImportant {fg = hsl(green)},
    cssVendor {fg = hsl(fg1)},
    cssTextProp {fg = hsl(aqua)},
    cssAnimationProp {fg = hsl(aqua)},
    cssUIProp {fg = hsl(yellow)},
    cssTransformProp {fg = hsl(aqua)},
    cssTransitionProp {fg = hsl(aqua)},
    cssPrintProp {fg = hsl(aqua)},
    cssPositioningProp {fg = hsl(yellow)},
    cssBoxProp {fg = hsl(aqua)},
    cssFontDescriptorProp {fg = hsl(aqua)},
    cssFlexibleBoxProp {fg = hsl(aqua)},
    cssBorderOutlineProp {fg = hsl(aqua)},
    cssBackgroundProp {fg = hsl(aqua)},
    cssMarginProp {fg = hsl(aqua)},
    cssListProp {fg = hsl(aqua)},
    cssTableProp {fg = hsl(aqua)},
    cssFontProp {fg = hsl(aqua)},
    cssPaddingProp {fg = hsl(aqua)},
    cssDimensionProp {fg = hsl(aqua)},
    cssRenderProp {fg = hsl(aqua)},
    cssColorProp {fg = hsl(aqua)},
    cssGeneratedContentProp {fg = hsl(aqua)},

    -- js
    javaScriptBraces {fg = hsl(fg1)},
    javaScriptFunction {fg = hsl(aqua)},
    javaScriptIdentifier {fg = hsl(red)},
    javaScriptMember {fg = hsl(blue)},
    javaScriptNumber {fg = hsl(purple)},
    javaScriptNull {fg = hsl(purple)},
    javaScriptParens {fg = hsl(fg3)},
    javascriptImport {fg = hsl(aqua)},
    javascriptExport {fg = hsl(aqua)},
    javascriptClassKeyword {fg = hsl(aqua)},
    javascriptClassExtends {fg = hsl(aqua)},
    javascriptDefault {fg = hsl(aqua)},
    javascriptClassName {fg = hsl(yellow)},
    javascriptClassSuperName {fg = hsl(yellow)},
    javascriptGlobal {fg = hsl(yellow)},
    javascriptEndColons {fg = hsl(fg1)},
    javascriptFuncArg {fg = hsl(fg1)},
    javascriptGlobalMethod {fg = hsl(fg1)},
    javascriptNodeGlobal {fg = hsl(fg1)},
    javascriptBOMWindowProp {fg = hsl(fg1)},
    javascriptArrayMethod {fg = hsl(fg1)},
    javascriptArrayStaticMethod {fg = hsl(fg1)},
    javascriptCacheMethod {fg = hsl(fg1)},
    javascriptDateMethod {fg = hsl(fg1)},
    javascriptMathStaticMethod {fg = hsl(fg1)},
    javascriptProp {fg = hsl(fg1)},
    javascriptURLUtilsProp {fg = hsl(fg1)},
    javascriptBOMNavigatorProp {fg = hsl(fg1)},
    javascriptDOMDocMethod {fg = hsl(fg1)},
    javascriptDOMDocProp {fg = hsl(fg1)},
    javascriptBOMLocationMethod {fg = hsl(fg1)},
    javascriptBOMWindowMethod {fg = hsl(fg1)},
    javascriptStringMethod {fg = hsl(fg1)},
    javascriptVariable {fg = hsl(orange)},
    javascriptClassSuper {fg = hsl(orange)},
    javascriptFuncKeyword {fg = hsl(aqua)},
    javascriptAsyncFunc {fg = hsl(aqua)},
    javascriptClassStatic {fg = hsl(orange)},
    javascriptOperator {fg = hsl(red)},
    javascriptForOperator {fg = hsl(red)},
    javascriptYield {fg = hsl(red)},
    javascriptExceptions {fg = hsl(red)},
    javascriptMessage {fg = hsl(red)},
    javascriptTemplateSB {fg = hsl(aqua)},
    javascriptTemplateSubstitution {fg = hsl(fg1)},
    javascriptLabel {fg = hsl(fg1)},
    javascriptObjectLabel {fg = hsl(fg1)},
    javascriptPropertyName {fg = hsl(fg1)},
    javascriptLogicSymbols {fg = hsl(fg1)},
    javascriptArrowFunc {fg = hsl(yellow)},
    javascriptDocParamName {fg = hsl(fg4)},
    javascriptDocTags {fg = hsl(fg4)},
    javascriptDocNotation {fg = hsl(fg4)},
    javascriptDocParamType {fg = hsl(fg4)},
    javascriptDocNamedParamType {fg = hsl(fg4)},
    javascriptBrackets {fg = hsl(fg1)},
    javascriptDOMElemAttrs {fg = hsl(fg1)},
    javascriptDOMEventMethod {fg = hsl(fg1)},
    javascriptDOMNodeMethod {fg = hsl(fg1)},
    javascriptDOMStorageMethod {fg = hsl(fg1)},
    javascriptHeadersMethod {fg = hsl(fg1)},
    javascriptAsyncFuncKeyword {fg = hsl(red)},
    javascriptAwaitFuncKeyword {fg = hsl(red)},
    jsClassKeyword {fg = hsl(aqua)},
    jsExtendsKeyword {fg = hsl(aqua)},
    jsExportDefault {fg = hsl(aqua)},
    jsTemplateBraces {fg = hsl(aqua)},
    jsGlobalNodeObjects {fg = hsl(blue)},
    jsGlobalObjects {fg = hsl(blue)},
    jsObjectKey {fg = hsl(green), gui = styles.bold},
    jsFunction {fg = hsl(aqua)},
    jsFuncCall {fg = hsl(blue)},
    jsFuncParens {fg = hsl(fg3)},
    jsParens {fg = hsl(fg3)},
    jsNull {fg = hsl(purple)},
    jsUndefined {fg = hsl(purple)},
    jsClassDefinition {fg = hsl(yellow)},
    jsOperatorKeyword {fg = hsl(red)},

    -- typescript
    typescriptReserved {fg = hsl(aqua)},
    typescriptLabel {fg = hsl(aqua)},
    typescriptFuncKeyword {fg = hsl(aqua)},
    typescriptIdentifier {fg = hsl(orange)},
    typescriptBraces {fg = hsl(fg1)},
    typescriptEndColons {fg = hsl(fg1)},
    typescriptDOMObjects {fg = hsl(fg1)},
    typescriptAjaxMethods {fg = hsl(fg1)},
    typescriptLogicSymbols {fg = hsl(fg1)},
    typescriptDocSeeTag {SpecialComment},
    typescriptDocParam {SpecialComment},
    typescriptDocTags {SpecialComment},
    typescriptGlobalObjects {fg = hsl(fg1)},
    typescriptParens {fg = hsl(fg3)},
    typescriptOpSymbols {fg = hsl(fg3)},
    typescriptHtmlElemProperties {fg = hsl(fg1)},
    typescriptNull {fg = hsl(purple)},
    typescriptInterpolationDelimiter {fg = hsl(aqua)},

    -- jsx
    jsxTagName {fg = hsl(aqua)},
    jsxComponentName {fg = hsl(green)},
    jsxCloseString {fg = hsl(fg4)},
    jsxAttrib {fg = hsl(yellow)},
    jsxEqual {fg = hsl(aqua)},

    -- purescript
    purescriptModuleKeyword {fg = hsl(aqua)},
    purescriptModuleName {fg = hsl(fg1)},
    purescriptWhere {fg = hsl(aqua)},
    purescriptDelimiter {fg = hsl(fg4)},
    purescriptType {fg = hsl(fg1)},
    purescriptImportKeyword {fg = hsl(aqua)},
    purescriptHidingKeyword {fg = hsl(aqua)},
    purescriptAsKeyword {fg = hsl(aqua)},
    purescriptStructure {fg = hsl(aqua)},
    purescriptOperator {fg = hsl(blue)},
    purescriptTypeVar {fg = hsl(fg1)},
    purescriptConstructor {fg = hsl(fg1)},
    purescriptFunction {fg = hsl(fg1)},
    purescriptConditional {fg = hsl(orange)},
    purescriptBacktick {fg = hsl(orange)},

    -- coffeescript
    coffeeExtendedOp {fg = hsl(fg3)},
    coffeeSpecialOp {fg = hsl(fg3)},
    coffeeCurly {fg = hsl(orange)},
    coffeeParen {fg = hsl(fg3)},
    coffeeBracket {fg = hsl(orange)},

    -- ruby
    rubyStringDelimiter {fg = hsl(green)},
    rubyInterpolationDelimiter {fg = hsl(aqua)},

    -- obj-c
    objcTypeModifier {fg = hsl(red)},
    objcDirective {fg = hsl(blue)},

    -- moonscript
    moonSpecialOp {fg = hsl(fg3)},
    moonExtendedOp {fg = hsl(fg3)},
    moonFunction {fg = hsl(fg3)},
    moonObject {fg = hsl(yellow)},

    -- elixir
    elixirDocString {SpecialComment},
    elixirStringDelimiter {fg = hsl(green)},
    elixirInterpolationDelimiter {fg = hsl(aqua)},
    elixirModuleDeclaration {fg = hsl(yellow)},

    -- scala
    scalaNameDefinition {fg = hsl(fg1)},
    scalaCaseFollowing {fg = hsl(fg1)},
    scalaCapitalWord {fg = hsl(fg1)},
    scalaTypeExtension {fg = hsl(fg1)},
    scalaKeyword {fg = hsl(red)},
    scalaKeywordModifier {fg = hsl(red)},
    scalaSpecial {fg = hsl(aqua)},
    scalaOperator {fg = hsl(fg1)},
    scalaTypeDeclaration {fg = hsl(yellow)},
    scalaTypeTypePostDeclaration {fg = hsl(yellow)},
    scalaInstanceDeclaration {fg = hsl(fg1)},
    scalaInterpolation {fg = hsl(aqua)},

    -- markdown
    markdownItalic {fg = hsl(fg3), gui = italic_strings},
    markdownH1 {fg = hsl(green), gui = styles.bold},
    markdownH2 {markdownH1},
    markdownH3 {fg = hsl(yellow), gui = styles.bold},
    markdownH4 {markdownH3},
    markdownH5 {fg = hsl(yellow)},
    markdownH6 {markdownH5},
    markdownCode {fg = hsl(aqua)},
    markdownCodeBlock {fg = hsl(aqua)},
    markdownCodeDelimiter {fg = hsl(aqua)},
    markdownBlockquote {fg = hsl(gray)},
    markdownListMarker {fg = hsl(gray)},
    markdownOrderedListMarker {fg = hsl(gray)},
    markdownRule {fg = hsl(gray)},
    markdownHeadingRule {fg = hsl(gray)},
    markdownUrlDelimiter {fg = hsl(fg3)},
    markdownLinkDelimiter {fg = hsl(fg3)},
    markdownLinkTextDelimiter {fg = hsl(fg3)},
    markdownHeadingDelimiter {fg = hsl(orange)},
    markdownUrl {fg = hsl(purple)},
    markdownUrlTitleDelimiter {fg = hsl(green)},
    markdownLinkText {fg = hsl(gray), gui = styles.underline},
    markdownIdDeclaration {markdownLinkText},

    -- haskell
    haskellType {fg = hsl(blue)},
    haskellIdentifier {fg = hsl(aqua)},
    haskellSeparator {fg = hsl(fg4)},
    haskellDelimiter {fg = hsl(orange)},
    haskellOperators {fg = hsl(purple)},
    haskellBacktick {fg = hsl(orange)},
    haskellStatement {fg = hsl(purple)},
    haskellConditional {fg = hsl(purple)},
    haskellLet {fg = hsl(red)},
    haskellDefault {fg = hsl(red)},
    haskellWhere {fg = hsl(red)},
    haskellBottom {fg = hsl(red), gui = styles.bold},
    haskellImportKeywords {fg = hsl(purple), gui = styles.bold},
    haskellDeclKeyword {fg = hsl(orange)},
    haskellDecl {fg = hsl(orange)},
    haskellDeriving {fg = hsl(purple)},
    haskellAssocType {fg = hsl(aqua)},
    haskellNumber {fg = hsl(aqua)},
    haskellPragma {fg = hsl(red), gui = styles.bold},
    haskellTH {fg = hsl(aqua), gui = styles.bold},
    haskellForeignKeywords {fg = hsl(green)},
    haskellKeyword {fg = hsl(red)},
    haskellFloat {fg = hsl(aqua)},
    haskellInfix {fg = hsl(purple)},
    haskellQuote {fg = hsl(green), gui = styles.bold},
    haskellShebang {fg = hsl(yellow), gui = styles.bold},
    haskellLiquid {fg = hsl(purple), gui = styles.bold},
    haskellQuasiQuoted {fg = hsl(blue), gui = styles.bold},
    haskellRecursiveDo {fg = hsl(purple)},
    haskellQuotedType {fg = hsl(red)},
    haskellPreProc {fg = hsl(fg4)},
    haskellTypeRoles {fg = hsl(red), gui = styles.bold},
    haskellTypeForall {fg = hsl(red)},
    haskellPatternKeyword {fg = hsl(blue)},

    -- json
    jsonKeyword {fg = hsl(green)},
    jsonQuote {fg = hsl(green)},
    jsonBraces {fg = hsl(fg1)},
    jsonString {fg = hsl(fg1)},

    -- mail.vim
    mailQuoted1 {fg = hsl(aqua)},
    mailQuoted2 {fg = hsl(purple)},
    mailQuoted3 {fg = hsl(yellow)},
    mailQuoted4 {fg = hsl(green)},
    mailQuoted5 {fg = hsl(red)},
    mailQuoted6 {fg = hsl(orange)},
    mailSignature {SpecialComment},

    -- csharp
    csBraces {fg = hsl(fg1)},
    csEndColon {fg = hsl(fg1)},
    csLogicSymbols {fg = hsl(fg1)},
    csParens {fg = hsl(fg3)},
    csOpSymbols {fg = hsl(fg3)},
    csInterpolationDelimiter {fg = hsl(fg3)},
    csInterpolationAlignDel {fg = hsl(aqua), gui = styles.bold},
    csInterpolationFormat {fg = hsl(aqua)},
    csInterpolationFormatDel {fg = hsl(aqua), gui = styles.bold},

    -- rust
    rustSigil {fg = hsl(orange)},
    rustEscape {fg = hsl(aqua)},
    rustStringContinuation {fg = hsl(aqua)},
    rustEnum {fg = hsl(aqua)},
    rustStructure {fg = hsl(aqua)},
    rustModPathSep {fg = hsl(fg2)},
    rustCommentLineDoc {SpecialComment},
    rustDefault {fg = hsl(aqua)},

    -- ocaml
    ocamlOperator {fg = hsl(fg1)},
    ocamlKeyChar {fg = hsl(orange)},
    ocamlArrow {fg = hsl(orange)},
    ocamlInfixOpKeyword {fg = hsl(red)},
    ocamlConstructor {fg = hsl(orange)},

    -- lua
    luaIn {fg = hsl(red)},
    luaFunction {fg = hsl(aqua)},
    luaTable {fg = hsl(orange)},

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
    -- signature
    SignatureMarkText {fg = hsl(blue), bg = hsl(sign_column)},
    SignatureMarkerText {fg = hsl(purple), bg = hsl(sign_column)},
    -- gitcommit
    gitcommitSelectedFile {fg = hsl(green)},
    gitcommitDiscardedFile {fg = hsl(red)},
  }
end)

-- loading highlight groups only if the plugin is installed
-- nvim-treesitter
if vim.g.loaded_nvim_treesitter == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
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
        TSEmphasis {gui = italic_strings},
        TSUnderline {gui = styles.underline},
        TSTitle {Title},
        TSLiteral {String},
        TSURI {Underlined},
        TSVariable {Special},
        TSVariableBuiltin {Special},
      }
    end))
end

-- telescope.nvim
local telescope_exists = pcall(require("telescope.builtin"))
if telescope_exists then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        -- telescope
        TelescopeSelection {fg = hsl(orange), gui = styles.bold},
        TelescopeSlectionCaret {fg = hsl(red)},
        TelescopeMultiSelection {fg = hsl(gray)},
        TelescopeNormal {fg = hsl(fg1)},
        TelescopeBorder {TelescopeNormal},
        TelescopePromptBorder {TelescopeNormal},
        TelescopeResultsBorder {TelescopeNormal},
        TelescopePreviewBorder {TelescopeNormal},
        TelescopeMatching {fg = hsl(blue)},
        TelescopePromptPrefix {fg = hsl(red)},
        TelescopePrompt {TelescopeNormal},
      }
    end))
end

-- lspsaga.nvim
if vim.g.loaded_lspsaga == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        LspSagaDiagnosticBorder {NormalNC},
        LspSagaDiagnosticHeader {fg = hsl(red)},
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
        SagaShadow {bg = hsl(bg0)},
        LspSagaFinderSelection {Search},
        DiagnosticTruncateLine {NormalNC},
        DiagnosticError {LspDiagnosticsError},
        DiagnosticWarning {LspDiagnosticsWarning},
        DiagnosticInformation {LspDiagnosticsInformation},
        DiagnosticHint {LspDiagnosticsHint},
        DefinitionPreviewTitle {Title},
        LspSagaShTruncateLine {NormalNC},
        LspSagaDocTruncateLine {NormalNC},
        LineDiagTuncateLine {NormalNC},
        LspSagaCodeActionTitle {Title},
        LspSagaCodeActionTruncateLine {NormalNC},
        LspSagaCodeActionContent {Normal},
        LspSagaRenamePromptPrefix {fg = hsl(fg2)},
        LspSagaRenameBorder {gui = styles.bold},
        LspSagaHoverBorder {gui = styles.bold},
        LspSagaSignatureHelpBorder {gui = styles.bold},
        LspSagaCodeActionBorder {gui = styles.bold},
        LspSagaAutoPreview {},
        LspSagaDefPreviewBorder {gui = styles.bold},
        LspLinesDiagBorder {gui = styles.bold},
      }
    end))
end

-- vim-startify
if vim.g.loaded_startify == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
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
      }
    end))
end

-- vim-signify
if vim.g.loaded_signify == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        SignifySignAdd {fg = hsl(green), bg = hsl(sign_column), gui = invert_signs},
        SignifySignChange {fg = hsl(aqua), bg = hsl(sign_column), gui = invert_signs},
        SignifySignDelete {fg = hsl(red), bg = hsl(sign_column), gui = invert_signs},
      }
    end))
end

-- vim-dirvish
if vim.g.loaded_dirvish == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {DirvishPathTail {fg = hsl(aqua)}, DirvishArg {fg = hsl(yellow)}}
    end))
end

-- nerdtree 
if vim.g.loaded_nerd_tree == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        NERDTreeDir {fg = hsl(aqua)},
        NERDTreeDirSlash {fg = hsl(aqua)},
        NERDTreeOpenable {fg = hsl(orange)},
        NERDTreeClosable {fg = hsl(orange)},
        NERDTreeFile {fg = hsl(fg1)},
        NERDTreeExecFile {fg = hsl(yellow)},
        NERDTreeUp {fg = hsl(gray)},
        NERDTreeCWD {fg = hsl(green)},
        NERDTreeHelp {fg = hsl(fg1)},
        NERDTreeToggleOn {fg = hsl(green)},
        NERDTreeToggleOff {fg = hsl(red)},

      }
    end))
end

-- coc.nvim
if vim.g.did_coc_loaded == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        CocErrorSign {fg = hsl(red), bg = hsl(sign_column)},
        CocWarningSign {fg = hsl(orange), bg = hsl(sign_column)},
        CocInfoSign {fg = hsl(blue), bg = hsl(sign_column)},
        CocHintSign {fg = hsl(aqua), bg = hsl(sign_column)},
        CocErrorFloat {fg = hsl(red)},
        CocWarningFloat {fg = hsl(orange)},
        CocInfoFloat {fg = hsl(blue)},
        CocHintFloat {fg = hsl(aqua)},
        CocDiagnosticsError {fg = hsl(red)},
        CocDiagnosticsWarning {fg = hsl(orange)},
        CocDiagnosticsInfo {fg = hsl(blue)},
        CocDiagnosticsHint {fg = hsl(aqua)},
        CocSelectedText {fg = hsl(red)},
        CocCodeLens {fg = hsl(gray)},
        CocErrorHighlight {fg = hsl(red), gui = styles.underline},
        CocWarningHighlight {fg = hsl(orange), gui = styles.underline},
        CocInfoHighlight {fg = hsl(blue), gui = styles.underline},
        CocHintHighlight {fg = hsl(aqua), gui = styles.underline},

      }
    end))
end

-- ale.vim
if vim.g.loaded_ale_dont_use_this_in_other_plugins_please == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        ALEError {fg = hsl(red), gui = styles.underline},
        ALEWarning {fg = hsl(yellow), gui = styles.underline},
        ALEInfo {fg = hsl(blue), gui = styles.underline},
        ALEErrorSign {fg = hsl(red), bg = hsl(sign_column)},
        ALEWarningSign {fg = hsl(yellow), bg = hsl(sign_column)},
        ALEInfoSign {fg = hsl(blue), bg = hsl(sign_column)},
        ALEVirtualTextError {fg = hsl(red)},
        ALEVirtualTextWarning {fg = hsl(yellow)},
        ALEVirtualTextInfo {fg = hsl(blue)},
      }
    end))
end

-- vim-buftabline
if vim.g.buftabline_show == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        BufTabLineCurrent {TabLineSel},
        BufTabLineActive {PmenuSel},
        BufTabLineHidden {TabLine},
        BufTabLineFill {TablineFill},
        BufTabLineModifiedCurrent {BufTabLineCurrent},
        BufTabLineModifiedActive {BufTabLineActive},
        BufTabLineModifiedHidden {BufTabLineHidden},
      }
    end))
end

-- ctrlP 
if vim.g.loaded_ctrlp == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        CtrlPMatch {Identifier},
        CtrlPNoEntries {Error},
        CtrlPPrtBase {Comment},
        CtrlPPrtCursor {Constant},
        CtrlPLinePre {fg = hsl(bg2)},
        CtrlPMode1 {Character},
        CtrlPMode2 {LineNr},
        CtrlPStats {Function},
      }
    end))
end

-- fzf.vim
if vim.g.loaded_fzf_vim == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        Fzf1 {fg = hsl(blue), bg = hsl(bg1)},
        Fzf2 {fg = hsl(orange), bg = hsl(bg1)},
        Fzf3 {fg = hsl(fg4), bg = hsl(bg1)},
      }
    end))
end

if vim.g.loaded_showmarks == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        ShowMarksHLl {fg = hsl(blue), bg = hsl(sign_column)},
        ShowMarksHLu {fg = hsl(blue), bg = hsl(sign_column)},
        ShowMarksHLo {fg = hsl(blue), bg = hsl(sign_column)},
        ShowMarksHLm {fg = hsl(blue), bg = hsl(sign_column)},
      }
    end))
end

if vim.g.loaded_gitgutter == true then
  groups = vim.tbl_extend("force", groups, lush(
                            function()
      return {
        GitGutterAdd {fg = hsl(green), bg = hsl(sign_column)},
        GitGutterChange {fg = hsl(aqua), bg = hsl(sign_column)},
        GitGutterDelete {fg = hsl(red), bg = hsl(sign_column)},
        GitGutterChangeDelete {fg = hsl(aqua), bg = hsl(sign_column)},
      }
    end))
end

return groups
