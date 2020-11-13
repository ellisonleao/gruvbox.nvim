local Color, colors, Group, groups, styles = require("colorbuddy").setup()
local palette = require("gruvbox.palette")

for k, item in pairs(palette) do
  Color.new(k, item)
end

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

local tabline_sel = green
if vim.g.gruvbox_tabline_sel then
  tabline_sel = colors[vim.g.gruvbox_tabline_sel]
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
Group.new("GruvboxAquaSign", aqua, sign_column, invert_signs)
Group.new("GruvboxBlueSign", blue, sign_column, invert_signs)
Group.new("GruvboxGreenSign", green, sign_column, invert_signs)
Group.new("GruvboxOrangeSign", orange, sign_column, invert_signs)
Group.new("GruvboxPurpleSign", purple, sign_column, invert_signs)
Group.new("GruvboxRedSign", red, sign_column, invert_signs)
Group.new("GruvboxYellowSign", yellow, sign_column, invert_signs)

-- underlines
Group.new("GruvboxAquaUnderline", nil, nil, styles.undercurl, red)
Group.new("GruvboxBlueUnderline", nil, nil, styles.undercurl, blue)
Group.new("GruvboxGreenUnderline", nil, nil, styles.undercurl, green)
Group.new("GruvboxOrangeUnderline", nil, nil, styles.undercurl, orange)
Group.new("GruvboxPurpleUnderline", nil, nil, styles.undercurl, purple)
Group.new("GruvboxRedUnderline", nil, nil, styles.undercurl, red)
Group.new("GruvboxYellowUnderline", nil, nil, styles.undercurl, yellow)

-- base highlight groups
Group.new("Normal", fg0, bg0)
Group.new("CursorLine", nil, bg1)
Group.new("CursorColumn", groups.CursorLine, groups.CursorLine, groups.CursorLine)
Group.new("TabLineFill", bg4, bg1, invert_tabline)
Group.new("TabLineSel", tabline_sel, bg1, invert_tabline)
Group.new("TabLine", groups.TabLineFill, groups.TabLineFill, groups.TabLineFill)
Group.new("MatchParen", nil, bg3, styles.bold)
Group.new("ColorColumn", nil, color_column)
Group.new("Conceal", blue, nil)
Group.new("CursorLineNr", yellow, bg1)
Group.new("NonText", groups.GruvboxBg2, groups.GruvboxBg2, groups.GruvboxBg2)
Group.new("SpecialKey", groups.GruvboxFg4, groups.GruvboxFg4, groups.GruvboxFg4)
Group.new("Visual", nil, bg3, invert_selection)
Group.new("VisualNOS", groups.Visual, groups.Visual, groups.Visual)
Group.new("Search", hls_highlight, bg0, styles.inverse)
Group.new("IncSearch", hls_cursor, bg0, styles.inverse)
Group.new("QuickFixLine", bg0, yellow, styles.bold)
Group.new("Underlined", blue, nil, styles.underline)
Group.new("StatusLine", bg2, fg1, styles.inverse)
Group.new("StatusLineNC", bg1, fg4, styles.inverse)
Group.new("VertSplit", bg3, vert_split)
Group.new("WildMenu", blue, bg2, styles.bold)
Group.new("Directory", groups.GruvboxGreenBold, groups.GruvboxGreenBold,
          groups.GruvboxGreenBold)
Group.new("Title", groups.GruvboxGreenBold, groups.GruvboxGreenBold,
          groups.GruvboxGreenBold)
Group.new("ErrorMsg", bg0, red, styles.bold)
Group.new("MoreMsg", groups.GruvboxYellowBold, groups.GruvboxYellowBold,
          groups.GruvboxYellowBold)
Group.new("ModeMsg", groups.GruvboxYellowBold, groups.GruvboxYellowBold,
          groups.GruvboxYellowBold)
Group.new("Question", groups.GruvboxOrangeBold, groups.GruvboxOrangeBold,
          groups.GruvboxOrangeBold)
Group.new("WarningMsg", groups.GruvboxRedBold, groups.GruvboxRedBold,
          groups.GruvboxRedBold)
Group.new("LineNr", bg4, number_column)
Group.new("SignColumn", nil, sign_column)
Group.new("Folded", colors.gray, bg1, styles.italic)
Group.new("FoldColumn", colors.gray, groups.GruvboxBg1)
Group.new("Cursor", nil, nil, styles.inverse)
Group.new("iCursor", groups.Cursor, groups.Cursor, groups.Cursor)
Group.new("lCursor", groups.Cursor, groups.Cursor, groups.Cursor)
Group.new("vCursor", groups.Cursor, groups.Cursor, groups.Cursor)

-- Syntax highlight
if vim.g.gruvbox_improved_strings then
  Group.new("Special", orange, bg1, italic_strings)
  Group.new("String", fg1, bg1, italic_strings)
else
  Group.new("Special", groups.GruvboxOrange, groups.GruvboxOrange, groups.GruvboxOrange)
  Group.new("String", green, nil, italic_strings)
end

-- TODO(ellisonleao)
Group.new("Comment", colors.gray, nil, italic_comments)
Group.new("Todo", fg0, bg0, styles.bold + styles.italic)
Group.new("Error", red, bg0, styles.bold + styles.inverse)
Group.new("Statement", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("Conditional", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("Repeat", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("Label", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("Exception", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("Operator", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("Keyword", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("Identifier", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("Function", groups.GruvboxGreenBold, groups.GruvboxGreenBold,
          groups.GruvboxGreenBold)
Group.new("PreProc", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("Include", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("Define", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("Macro", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("PreCondit", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("Constant", groups.GruvboxPurple, groups.GruvboxPurple, groups.GruvboxPurple)
Group.new("Character", groups.GruvboxPurple, groups.GruvboxPurple, groups.GruvboxPurple)
Group.new("Boolean", groups.GruvboxPurple, groups.GruvboxPurple, groups.GruvboxPurple)
Group.new("Number", groups.GruvboxPurple, groups.GruvboxPurple, groups.GruvboxPurple)
Group.new("Float", groups.GruvboxPurple, groups.GruvboxPurple, groups.GruvboxPurple)
Group.new("Type", groups.GruvboxYellow, groups.GruvboxYellow, groups.GruvboxYellow)
Group.new("StorageClass", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("Structure", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("Typedef", groups.GruvboxYellow, groups.GruvboxYellow, groups.GruvboxYellow)

-- Completion menu
Group.new("Pmenu", fg1, bg2)
Group.new("PmenuSel", bg2, blue, styles.bold)
Group.new("PmenuSbar", nil, bg2)
Group.new("PmenuThumb", nil, bg4)

-- Diffs
Group.new("DiffDelete", red, bg0, styles.inverse)
Group.new("DiffAdd", green, bg0, styles.inverse)
Group.new("DiffChange", aqua, bg0, styles.inverse)
Group.new("DiffText", yellow, bg0, styles.inverse)

-- Spelling
if vim.fn.has("spell") == 1 then
  Group.new("SpellBad", groups.GruvboxRedUnderline, groups.GruvboxRedUnderline,
            groups.GruvboxRedUnderline)
  Group.new("SpellLocal", groups.GruvboxAquaUnderline, groups.GruvboxAquaUnderline,
            groups.GruvboxAquaUnderline)
  Group.new("SpellRare", groups.GruvboxPurpleUnderline, groups.GruvboxPurpleUnderline,
            groups.GruvboxPurpleUnderline)

  if vim.g.gruvbox_improved_warnings then
    Group.new("SpellCap", green, nil, styles.bold + styles.underline)
  else
    Group.new("SpellRare", groups.GruvboxBlueUnderline, groups.GruvboxBlueUnderline,
              groups.GruvboxBlueUnderline)
  end
end

-- Filetype specific

-- HTML
Group.new("htmlTag", groups.GruvboxAquaBold, groups.GruvboxAquaBold,
          groups.GruvboxAquaBold)
Group.new("htmlEndTag", groups.GruvboxAquaBold, groups.GruvboxAquaBold,
          groups.GruvboxAquaBold)
Group.new("htmlTagName", groups.GruvboxBlueBold, groups.GruvboxBlueBold,
          groups.GruvboxBlueBold)
Group.new("htmlArg", groups.GruvboxOrange, groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange, groups.GruvboxOrange)
Group.new("htmlScriptTag", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("htmlTagN", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("htmlSpecialTagName", groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue)
Group.new("htmlLink", fg4, nil, styles.underline)
Group.new("htmlSpecialChar", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("htmlBold", fg0, bg0, styles.bold)
Group.new("htmlBoldUnderline", fg0, bg0, styles.bold + styles.underline)
Group.new("htmlBoldItalic", fg0, bg0, styles.bold + styles.italic)
Group.new("htmlBoldUnderlineItalic", fg0, bg0,
          styles.bold + styles.underline + styles.italic)
Group.new("htmlUnderline", fg0, bg0, styles.underline)
Group.new("htmlUnderlineItalic", fg0, bg0, styles.underline + styles.italic)
Group.new("htmlItalic", fg0, bg0, styles.italic)
Group.new("htmlH1", groups.String, groups.String, groups.String)

-- XML
Group.new("xmlTag", groups.GruvboxAquaBold, groups.GruvboxAquaBold,
          groups.GruvboxAquaBold)
Group.new("xmlEndTag", groups.GruvboxAquaBold, groups.GruvboxAquaBold,
          groups.GruvboxAquaBold)
Group.new("xmlTagName", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("xmlEqual", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("docbkKeyword", groups.GruvboxAquaBold, groups.GruvboxAquaBold,
          groups.GruvboxAquaBold)
Group.new("xmlDocTypeDecl", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray)
Group.new("xmlDocTypeKeyword", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("xmlCdataStart", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray)
Group.new("xmlCdataCdata", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("dtdFunction", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray)
Group.new("dtdTagName", groups.GruvboxPurple, groups.GruvboxPurple, groups.GruvboxPurple)
Group.new("xmlAttrib", groups.GruvboxOrange, groups.GruvboxOrange, groups.GruvboxOrange)
Group.new("xmlProcessingDelim", groups.GruvboxGray, groups.GruvboxGray,
          groups.GruvboxGray)
Group.new("dtdParamEntityPunct", groups.GruvboxGray, groups.GruvboxGray,
          groups.GruvboxGray)
Group.new("dtdParamEntityDPunct", groups.GruvboxGray, groups.GruvboxGray,
          groups.GruvboxGray)
Group.new("xmlAttribPunct", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray)
Group.new("xmlEntity", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("xmlEntityPunct", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)

-- VimL
Group.new("vimCommentTitle", fg4, nil, styles.bold + italic_comments)
Group.new("vimNotation", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("vimBracket", groups.GruvboxOrange, groups.GruvboxOrange, groups.GruvboxOrange)
Group.new("vimMapModKey", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("vimFuncSID", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("vimSetSep", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("vimSep", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("vimContinue", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)

-- Python
Group.new("pythonBuiltin", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("pythonBuiltinObj", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("pythonBuiltinFunc", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("pythonFunction", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("pythonDecorator", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed, groups.GruvboxRed)
Group.new("pythonInclude", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("pythonImport", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("pythonRun", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("pythonCoding", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("pythonOperator", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed, groups.GruvboxRed)
Group.new("pythonException", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed, groups.GruvboxRed)
Group.new("pythonExceptions", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("pythonBoolean", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("pythonDot", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("pythonConditional", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed, groups.GruvboxRed)
Group.new("pythonRepeat", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed, groups.GruvboxRed)
Group.new("pythonDottedName", groups.GruvboxGreenBold, groups.GruvboxGreenBold,
          groups.GruvboxGreenBold)

-- CSS
Group.new("cssBraces", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("cssFunctionName", groups.GruvboxYellow, groups.GruvboxYellow,
          groups.GruvboxYellow)
Group.new("cssIdentifier", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("cssClassName", groups.GruvboxGreen, groups.GruvboxGreen, groups.GruvboxGreen,
          groups.GruvboxGreen, groups.GruvboxGreen)
Group.new("cssColor", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("cssSelectorOp", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("cssSelectorOp2", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("cssImportant", groups.GruvboxGreen, groups.GruvboxGreen, groups.GruvboxGreen,
          groups.GruvboxGreen, groups.GruvboxGreen)
Group.new("cssVendor", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("cssTextProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssAnimationProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssUIProp", groups.GruvboxYellow, groups.GruvboxYellow, groups.GruvboxYellow,
          groups.GruvboxYellow, groups.GruvboxYellow)
Group.new("cssTransformProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssTransitionProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("cssPrintProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssPositioningProp", groups.GruvboxYellow, groups.GruvboxYellow,
          groups.GruvboxYellow)
Group.new("cssBoxProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssFontDescriptorProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("cssFlexibleBoxProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("cssBorderOutlineProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("cssBackgroundProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("cssMarginProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssListProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssTableProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssFontProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssPaddingProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssDimensionProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssRenderProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssColorProp", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("cssGeneratedContentProp", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)

-- JavaScript

Group.new("javaScriptBraces", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("javaScriptFunction", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("javaScriptIdentifier", groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed)
Group.new("javaScriptMember", groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("javaScriptNumber", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("javaScriptNull", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("javaScriptParens", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)

-- TypeScript
Group.new("typeScriptReserved", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("typeScriptLabel", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("typeScriptFuncKeyword", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("typeScriptIdentifier", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("typeScriptBraces", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("typeScriptEndColons", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("typeScriptDOMObjects", groups.GruvboxFg1, groups.GruvboxFg1,
          groups.GruvboxFg1)
Group.new("typeScriptAjaxMethods", groups.GruvboxFg1, groups.GruvboxFg1,
          groups.GruvboxFg1)
Group.new("typeScriptLogicSymbols", groups.GruvboxFg1, groups.GruvboxFg1,
          groups.GruvboxFg1)
Group.new("typeScriptDocSeeTag", groups.Comment)
Group.new("typeScriptDocParam", groups.Comment)
Group.new("typeScriptDocTags", groups.vimCommentTitle)
Group.new("typeScriptGlobalObjects", groups.GruvboxFg1, groups.GruvboxFg1,
          groups.GruvboxFg1)
Group.new("typeScriptParens", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("typeScriptOpSymbols", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("typeScriptHtmlElemProperties", groups.GruvboxFg1, groups.GruvboxFg1,
          groups.GruvboxFg1)
Group.new("typeScriptNull", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("typeScriptInterpolationDelimiter", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)

-- Ruby
Group.new("rubyStringDelimiter", groups.GruvboxGreen, groups.GruvboxGreen,
          groups.GruvboxGreen)
Group.new("rubyInterpolationDelimiter", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)

-- Go
Group.new("goDirective", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("goConstants", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("goDeclaration", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed, groups.GruvboxRed)
Group.new("goDeclType", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("goBuiltins", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange, groups.GruvboxOrange, groups.GruvboxOrange)

-- Lua
Group.new("luaIn", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed, groups.GruvboxRed)
Group.new("luaFunction", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("luaTable", groups.GruvboxOrange, groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange, groups.GruvboxOrange)

-- Java
Group.new("javaAnnotation", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("javaDocTags", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("javaCommentTitle", groups.vimCommentTitle, groups.vimCommentTitle,
          groups.vimCommentTitle)
Group.new("javaParen", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("javaParen1", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("javaParen2", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("javaParen3", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("javaParen4", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("javaParen5", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("javaOperator", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("javaVarArg", groups.GruvboxGreen, groups.GruvboxGreen, groups.GruvboxGreen,
          groups.GruvboxGreen, groups.GruvboxGreen)

-- Elixir
Group.new("elixirDocString", groups.Comment, groups.Comment, groups.Comment)
Group.new("elixirStringDelimiter", groups.GruvboxGreen, groups.GruvboxGreen,
          groups.GruvboxGreen)
Group.new("elixirInterpolationDelimiter", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("elixirModuleDeclaration", groups.GruvboxYellow, groups.GruvboxYellow,
          groups.GruvboxYellow)

-- Markdown
Group.new("markdownItalic", fg3, nil, styles.italic)
Group.new("markdownLinkText", colors.gray, nil, styles.underline)
Group.new("markdownH1", groups.GruvboxGreenBold, groups.GruvboxGreenBold,
          groups.GruvboxGreenBold)
Group.new("markdownH2", groups.GruvboxGreenBold, groups.GruvboxGreenBold,
          groups.GruvboxGreenBold)
Group.new("markdownH3", groups.GruvboxYellowBold, groups.GruvboxYellowBold,
          groups.GruvboxYellowBold)
Group.new("markdownH4", groups.GruvboxYellowBold, groups.GruvboxYellowBold,
          groups.GruvboxYellowBold)
Group.new("markdownH5", groups.GruvboxYellow, groups.GruvboxYellow,
          groups.GruvboxYellow, groups.GruvboxYellow, groups.GruvboxYellow)
Group.new("markdownH6", groups.GruvboxYellow, groups.GruvboxYellow,
          groups.GruvboxYellow, groups.GruvboxYellow, groups.GruvboxYellow)
Group.new("markdownCode", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("markdownCodeBlock", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("markdownCodeDelimiter", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("markdownBlockquote", groups.GruvboxGray, groups.GruvboxGray,
          groups.GruvboxGray)
Group.new("markdownListMarker", groups.GruvboxGray, groups.GruvboxGray,
          groups.GruvboxGray)
Group.new("markdownOrderedListMarker", groups.GruvboxGray, groups.GruvboxGray,
          groups.GruvboxGray)
Group.new("markdownRule", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray,
          groups.GruvboxGray, groups.GruvboxGray)
Group.new("markdownHeadingRule", groups.GruvboxGray, groups.GruvboxGray,
          groups.GruvboxGray)
Group.new("markdownUrlDelimiter", groups.GruvboxFg3, groups.GruvboxFg3,
          groups.GruvboxFg3)
Group.new("markdownLinkDelimiter", groups.GruvboxFg3, groups.GruvboxFg3,
          groups.GruvboxFg3)
Group.new("markdownLinkTextDelimiter", groups.GruvboxFg3, groups.GruvboxFg3,
          groups.GruvboxFg3)
Group.new("markdownHeadingDelimiter", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("markdownUrl", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("markdownUrlTitleDelimiter", groups.GruvboxGreen, groups.GruvboxGreen,
          groups.GruvboxGreen)
Group.new("markdownIdDeclaration", groups.markdownLinkText, groups.markdownLinkText,
          groups.markdownLinkText)

-- Haskell
Group.new("haskellType", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("haskellIdentifier", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("haskellSeparator", groups.GruvboxFg4, groups.GruvboxFg4, groups.GruvboxFg4)
Group.new("haskellDelimiter", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("haskellOperators", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)

Group.new("haskellBacktick", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("haskellStatement", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("haskellConditional", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)

Group.new("haskellLet", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("haskellDefault", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("haskellWhere", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("haskellBottom", groups.GruvboxRedBold, groups.GruvboxRedBold,
          groups.GruvboxRedBold)
Group.new("haskellImportKeywords", groups.GruvboxPurpleBold, groups.GruvboxPurpleBold,
          groups.GruvboxPurpleBold)
Group.new("haskellDeclKeyword", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("haskellDecl", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("haskellDeriving", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("haskellAssocType", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)

Group.new("haskellNumber", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("haskellPragma", groups.GruvboxRedBold, groups.GruvboxRedBold,
          groups.GruvboxRedBold)

Group.new("haskellTH", groups.GruvboxAquaBold, groups.GruvboxAquaBold,
          groups.GruvboxAquaBold)
Group.new("haskellForeignKeywords", groups.GruvboxGreen, groups.GruvboxGreen,
          groups.GruvboxGreen)
Group.new("haskellKeyword", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("haskellFloat", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("haskellInfix", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("haskellQuote", groups.GruvboxGreenBold, groups.GruvboxGreenBold,
          groups.GruvboxGreenBold)
Group.new("haskellShebang", groups.GruvboxYellowBold, groups.GruvboxYellowBold,
          groups.GruvboxYellowBold)
Group.new("haskellLiquid", groups.GruvboxPurpleBold, groups.GruvboxPurpleBold,
          groups.GruvboxPurpleBold)
Group.new("haskellQuasiQuoted", groups.GruvboxBlueBold, groups.GruvboxBlueBold,
          groups.GruvboxBlueBold)
Group.new("haskellRecursiveDo", groups.GruvboxPurple, groups.GruvboxPurple,
          groups.GruvboxPurple)
Group.new("haskellQuotedType", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("haskellPreProc", groups.GruvboxFg4, groups.GruvboxFg4, groups.GruvboxFg4)
Group.new("haskellTypeRoles", groups.GruvboxRedBold, groups.GruvboxRedBold,
          groups.GruvboxRedBold)
Group.new("haskellTypeForall", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("haskellPatternKeyword", groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue)

-- JSON
Group.new("jsonKeyword", groups.GruvboxGreen, groups.GruvboxGreen, groups.GruvboxGreen)
Group.new("jsonQuote", groups.GruvboxGreen, groups.GruvboxGreen, groups.GruvboxGreen)
Group.new("jsonBraces", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("jsonString", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)

-- Rust
Group.new("rustSigil", groups.GruvboxOrange, groups.GruvboxOrange, groups.GruvboxOrange)
Group.new("rustEscape", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("rustStringContinuation", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("rustEnum", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("rustStructure", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("rustModPathSep", groups.GruvboxFg2, groups.GruvboxFg2, groups.GruvboxFg2)
Group.new("rustCommentLineDoc", groups.Comment, groups.Comment, groups.Comment)
Group.new("rustDefault", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)

-- Ocaml
Group.new("ocamlOperator", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("ocamlKeyChar", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("ocamlArrow", groups.GruvboxOrange, groups.GruvboxOrange, groups.GruvboxOrange)
Group.new("ocamlInfixOpKeyword", groups.GruvboxRed, groups.GruvboxRed, groups.GruvboxRed)
Group.new("ocamlConstructor", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)

-- Plugin specific

-- vim-signify
Group.new("SignifySignAdd", groups.GruvboxGreenSign, groups.GruvboxGreenSign,
          groups.GruvboxGreenSign)
Group.new("SignifySignChange", groups.GruvboxAquaSign, groups.GruvboxAquaSign,
          groups.GruvboxAquaSign)
Group.new("SignifySignDelete", groups.GruvboxRedSign, groups.GruvboxRedSign,
          groups.GruvboxRedSign)

-- vim-startify
Group.new("StartifyBracket", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("StartifyFile", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("StartifyNumber", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("StartifyPath", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray)
Group.new("StartifySlash", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray)
Group.new("StartifySection", groups.GruvboxYellow, groups.GruvboxYellow,
          groups.GruvboxYellow)
Group.new("StartifySpecial", groups.GruvboxBg2, groups.GruvboxBg2, groups.GruvboxBg2)
Group.new("StartifyHeader", groups.GruvboxOrange, groups.GruvboxOrange,
          groups.GruvboxOrange)
Group.new("StartifyFooter", groups.GruvboxBg2, groups.GruvboxBg2, groups.GruvboxBg2)

-- netrw
Group.new("netrwDir", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("netrwClassify", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("netrwLink", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray)
Group.new("netrwSymLink", groups.GruvboxFg1, groups.GruvboxFg1, groups.GruvboxFg1)
Group.new("netrwExe", groups.GruvboxYellow, groups.GruvboxYellow, groups.GruvboxYellow)
Group.new("netrwComment", groups.GruvboxGray, groups.GruvboxGray, groups.GruvboxGray)
Group.new("netrwList", groups.GruvboxBlue, groups.GruvboxBlue, groups.GruvboxBlue)
Group.new("netrwHelpCmd", groups.GruvboxAqua, groups.GruvboxAqua, groups.GruvboxAqua)
Group.new("netrwCmdSep", groups.GruvboxFg3, groups.GruvboxFg3, groups.GruvboxFg3)
Group.new("netrwVersion", groups.GruvboxGreen, groups.GruvboxGreen, groups.GruvboxGreen)

-- LSP
Group.new("LspDiagnosticsDefaultError", groups.GruvboxRed, groups.GruvboxRed,
          groups.GruvboxRed)
Group.new("LspDiagnosticsSignError", groups.GruvboxRedSign, groups.GruvboxRedSign,
          groups.GruvboxRedSign)
Group.new("LspDiagnosticsUnderlineError", groups.GruvboxRedUnderline,
          groups.GruvboxRedUnderline, groups.GruvboxRedUnderline)

Group.new("LspDiagnosticsDefaultWarning", groups.GruvboxYellow, groups.GruvboxYellow,
          groups.GruvboxYellow)
Group.new("LspDiagnosticsSignWarning", groups.GruvboxYellowSign,
          groups.GruvboxYellowSign, groups.GruvboxYellowSign)
Group.new("LspDiagnosticsUnderlineWarning", groups.GruvboxYellowUnderline,
          groups.GruvboxYellowUnderline, groups.GruvboxYellowUnderline)

Group.new("LspDiagnosticsDefaultInformation", groups.GruvboxBlue, groups.GruvboxBlue,
          groups.GruvboxBlue)
Group.new("LspDiagnosticsSignInformation", groups.GruvboxBlueSign,
          groups.GruvboxBlueSign, groups.GruvboxBlueSign)
Group.new("LspDiagnosticsUnderlineInformation", groups.GruvboxBlueUnderline,
          groups.GruvboxBlueUnderline, groups.GruvboxBlueUnderline)

Group.new("LspDiagnosticsDefaultHint", groups.GruvboxAqua, groups.GruvboxAqua,
          groups.GruvboxAqua)
Group.new("LspDiagnosticsSignHint", groups.GruvboxAquaSign, groups.GruvboxAquaSign,
          groups.GruvboxAquaSign)
Group.new("LspDiagnosticsUnderlineHint", groups.GruvboxAquaUnderline,
          groups.GruvboxAquaUnderline, groups.GruvboxAquaUnderline)

-- Galaxyline

-- Treesitter
