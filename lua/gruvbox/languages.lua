-- language specific higlights
local base = require("gruvbox.base")
local styles = require("gruvbox.settings").styles
local utils = require("gruvbox.utils")
local colors = require("gruvbox.colors")

-- xml
local xml = {
  xmlTag = base.GruvboxAquaBold,
  xmlEndTag = base.GruvboxAquaBold,
  xmlTagName = base.GruvboxBlue,
  xmlEqual = base.GruvboxBlue,
  docbkKeyword = base.GruvboxAquaBold,
  xmlDocTypeDecl = base.GruvboxGray,
  xmlDocTypeKeyword = base.GruvboxPurple,
  xmlCdataStart = base.GruvboxGray,
  xmlCdataCdata = base.GruvboxPurple,
  dtdFunction = base.GruvboxGray,
  dtdTagName = base.GruvboxPurple,
  xmlAttrib = base.GruvboxOrange,
  xmlProcessingDelim = base.GruvboxGray,
  dtdParamEntityPunct = base.GruvboxGray,
  dtdParamEntityDPunct = base.GruvboxGray,
  xmlAttribPunct = base.GruvboxGray,
  xmlEntity = base.GruvboxRed,
  xmlEntityPunct = base.GruvboxRed,
}

local purescript = {
  purescriptModuleKeyword = base.GruvboxAqua,
  purescriptModuleName = base.GruvboxFg1,
  purescriptWhere = base.GruvboxAqua,
  purescriptDelimiter = base.GruvboxFg4,
  purescriptType = base.GruvboxFg1,
  purescriptImportKeyword = base.GruvboxAqua,
  purescriptHidingKeyword = base.GruvboxAqua,
  purescriptAsKeyword = base.GruvboxAqua,
  purescriptStructure = base.GruvboxAqua,
  purescriptOperator = base.GruvboxBlue,
  purescriptTypeVar = base.GruvboxFg1,
  purescriptConstructor = base.GruvboxFg1,
  purescriptFunction = base.GruvboxFg1,
  purescriptConditional = base.GruvboxOrange,
  purescriptBacktick = base.GruvboxOrange,
}

local coffeescript = {
  coffeeExtendedOp = base.GruvboxFg3,
  coffeeSpecialOp = base.GruvboxFg3,
  coffeeCurly = base.GruvboxOrange,
  coffeeParen = base.GruvboxFg3,
  coffeeBracket = base.GruvboxOrange,
}

local objc = { objcTypeModifier = base.GruvboxRed, objcDirective = base.GruvboxBlue }

local moonscript = {
  moonSpecialOp = base.GruvboxFg3,
  moonExtendedOp = base.GruvboxFg3,
  moonFunction = base.GruvboxFg3,
  moonObject = base.GruvboxYellow,
}

local elixir = {
  elixirDocString = base.Comment,
  elixirStringDelimiter = base.GruvboxGreen,
  elixirInterpolationDelimiter = base.GruvboxAqua,
  elixirModuleDeclaration = base.GruvboxYellow,
}

local markdown = {
  markdownItalic = { fg = base.GruvboxFg3.fg, gui = styles.italic },
  markdownBold = { fg = base.GruvboxFg3.fg, gui = styles.bold },
  markdownBoldItalic = {
    fg = base.GruvboxFg3.fg,
    gui = table.concat({ styles.bold, styles.italic }, ","),
  },
  markdownH1 = base.GruvboxGreenBold,
  markdownH2 = "markdownH1",
  markdownH3 = base.GruvboxYellowBold,
  markdownH4 = "markdownH3",
  markdownH5 = base.GruvboxYellow,
  markdownH6 = "markdownH5",
  markdownCode = base.GruvboxAqua,
  markdownCodeBlock = base.GruvboxAqua,
  markdownCodeDelimiter = base.GruvboxAqua,
  markdownBlockquote = base.GruvboxGray,
  markdownListMarker = base.GruvboxGray,
  markdownOrderedListMarker = base.GruvboxGray,
  markdownRule = base.GruvboxGray,
  markdownHeadingRule = base.GruvboxGray,
  markdownUrlDelimiter = base.GruvboxFg3,
  markdownLinkDelimiter = base.GruvboxFg3,
  markdownLinkTextDelimiter = base.GruvboxFg3,
  markdownHeadingDelimiter = base.GruvboxOrange,
  markdownUrl = base.GruvboxPurple,
  markdownUrlTitleDelimiter = base.GruvboxGreen,
  markdownLinkText = { fg = base.GruvboxGray.fg, gui = styles.underline },
  markdownIdDeclaration = "markdownLinkText",
}

local haskell = {
  haskellType = base.GruvboxBlue,
  haskellIdentifier = base.GruvboxAqua,
  haskellSeparator = base.GruvboxFg4,
  haskellDelimiter = base.GruvboxOrange,
  haskellOperators = base.GruvboxPurple,
  haskellBacktick = base.GruvboxOrange,
  haskellStatement = base.GruvboxPurple,
  haskellConditional = base.GruvboxPurple,
  haskellLet = base.GruvboxRed,
  haskellDefault = base.GruvboxRed,
  haskellWhere = base.GruvboxRed,
  haskellBottom = base.GruvboxRedBold,
  haskellImportKeywords = base.GruvboxPurpleBold,
  haskellDeclKeyword = base.GruvboxOrange,
  haskellDecl = base.GruvboxOrange,
  haskellDeriving = base.GruvboxPurple,
  haskellAssocType = base.GruvboxAqua,
  haskellNumber = base.GruvboxAqua,
  haskellPragma = base.GruvboxRedBold,
  haskellTH = base.GruvboxAquaBold,
  haskellForeignKeywords = base.GruvboxGreen,
  haskellKeyword = base.GruvboxRed,
  haskellFloat = base.GruvboxAqua,
  haskellInfix = base.GruvboxPurple,
  haskellQuote = base.GruvboxGreenBold,
  haskellShebang = base.GruvboxYellowBold,
  haskellLiquid = base.GruvboxPurpleBold,
  haskellQuasiQuoted = base.GruvboxBlueBold,
  haskellRecursiveDo = base.GruvboxPurple,
  haskellQuotedType = base.GruvboxRed,
  haskellPreProc = base.GruvboxFg4,
  haskellTypeRoles = base.GruvboxRedBold,
  haskellTypeForall = base.GruvboxRed,
  haskellPatternKeyword = base.GruvboxBlue,
}

local html = {
  htmlTag = base.GruvboxAquaBold,
  htmlEndTag = base.GruvboxAquaBold,
  htmlTagName = base.GruvboxBlue,
  htmlArg = base.GruvboxOrange,
  htmlTagN = base.GruvboxFg1,
  htmlSpecialTagName = base.GruvboxBlue,
  htmlLink = { fg = colors.fg4, gui = styles.underline },
  htmlSpecialChar = "GruvboxRed",
  htmlBold = { fg = colors.fg0, bg = colors.bg0, gui = styles.bold },
  htmlBoldUnderline = {
    fg = colors.fg0,
    bg = colors.bg0,
    gui = table.concat({ styles.bold, styles.underline }, ","),
  },
  htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, gui = table.concat({ styles.bold, styles.italic }, ",") },
  htmlBoldUnderlineItalic = {
    fg = colors.fg0,
    bg = colors.bg0,
    gui = table.concat({ styles.bold, styles.underline, styles.italic }, ","),
  },
  htmlUnderline = { fg = colors.fg0, bg = colors.bg0, gui = styles.underline },
  htmlUnderlineItalic = {
    fg = colors.fg0,
    bg = colors.bg0,
    gui = table.concat({ styles.underline, styles.italic }, ","),
  },
  htmlItalic = { fg = colors.fg0, bg = colors.bg0, gui = styles.italic },
}

local langs = utils.merge({
  xml,
  purescript,
  coffeescript,
  objc,
  moonscript,
  elixir,
  markdown,
  haskell,
  html,
})

return langs
