local M = {}

local function get_base_colors(colors, contrast)
  local bg = vim.o.background
  local base_colors = {
    -- options (dark mode by default)
    bg0 = colors.dark0,
    bg1 = colors.dark1,
    bg2 = colors.dark2,
    bg3 = colors.dark3,
    bg4 = colors.dark4,
    fg0 = colors.light0,
    fg1 = colors.light1,
    fg2 = colors.light2,
    fg3 = colors.light3,
    fg4 = colors.light4,
    red = colors.bright_red,
    green = colors.bright_green,
    yellow = colors.bright_yellow,
    blue = colors.bright_blue,
    purple = colors.bright_purple,
    aqua = colors.bright_aqua,
    orange = colors.bright_orange,
    gray = colors.gray,
  }

  local light_colors = {
    bg0 = colors.light0,
    bg1 = colors.light1,
    bg2 = colors.light2,
    bg3 = colors.light3,
    bg4 = colors.light4,
    fg0 = colors.dark0,
    fg1 = colors.dark1,
    fg2 = colors.dark2,
    fg3 = colors.dark3,
    fg4 = colors.dark4,
    red = colors.faded_red,
    green = colors.faded_green,
    yellow = colors.faded_yellow,
    blue = colors.faded_blue,
    purple = colors.faded_purple,
    aqua = colors.faded_aqua,
    orange = colors.faded_orange,
  }

  -- swap colors if light mode
  if bg == "light" then
    base_colors = light_colors
  end

  if contrast == "dark" then
    base_colors.bg0 = colors[bg .. "0_hard"]
  elseif contrast == "soft" then
    base_colors.bg0 = colors[bg .. "0_soft"]
  end

  return base_colors
end

M.setup = function()
  local config = require("gruvbox").config
  local palette = require("gruvbox.palette")
  local colors = get_base_colors(palette, config.contrast)

  local groups = {
    -- Base groups
    GruvboxFg0 = { fg = colors.fg0 },
    GruvboxFg1 = { fg = colors.fg1 },
    GruvboxFg2 = { fg = colors.fg2 },
    GruvboxFg3 = { fg = colors.fg3 },
    GruvboxFg4 = { fg = colors.fg4 },
    GruvboxGray = { fg = colors.gray },
    GruvboxBg0 = { fg = colors.bg0 },
    GruvboxBg1 = { fg = colors.bg1 },
    GruvboxBg2 = { fg = colors.bg2 },
    GruvboxBg3 = { fg = colors.bg3 },
    GruvboxBg4 = { fg = colors.bg4 },
    GruvboxRed = { fg = colors.red },
    GruvboxRedBold = { fg = colors.red, bold = config.bold },
    GruvboxGreen = { fg = colors.green },
    GruvboxGreenBold = { fg = colors.green, bold = config.bold },
    GruvboxYellow = { fg = colors.yellow },
    GruvboxYellowBold = { fg = colors.yellow, bold = config.bold },
    GruvboxBlue = { fg = colors.blue },
    GruvboxBlueBold = { fg = colors.blue, bold = config.bold },
    GruvboxPurple = { fg = colors.purple },
    GruvboxPurpleBold = { fg = colors.purple, bold = config.bold },
    GruvboxAqua = { fg = colors.aqua },
    GruvboxAquaBold = { fg = colors.aqua, bold = config.bold },
    GruvboxOrange = { fg = colors.orange },
    GruvboxOrangeBold = { fg = colors.orange, bold = config.bold },
    GruvboxRedSign = { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxGreenSign = { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxYellowSign = { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxBlueSign = { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxPurpleSign = { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxAquaSign = { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxOrangeSign = { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    GruvboxRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    GruvboxGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    GruvboxYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    GruvboxBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    GruvboxPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    GruvboxAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    GruvboxOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    Cursor = { reverse = config.inverse },
    lCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    vCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    Directory = { link = "GruvboxGreenBold" },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    VertSplit = { fg = colors.bg3, bg = colors.bg0 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic },
    FoldColumn = { fg = colors.gray, bg = colors.bg1 },
    SignColumn = { bg = colors.bg1 },
    IncSearch = { fg = colors.hls_cursor, bg = colors.bg0, reverse = config.inverse },
    LineNr = { fg = colors.bg4 },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ModeMsg = { link = "GruvboxYellowBold" },
    MoreMsg = { link = "GruvboxYellowBold" },
    NonText = { link = "GruvboxBg2" },
    Normal = { fg = colors.fg1, bg = colors.bg0 },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    Question = { link = "GruvboxOrangeBold" },
    QuickFixLine = { bg = colors.bg0, bold = config.bold },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    SpecialKey = { link = "GruvboxFg4" },
    SpellRare = { link = "GruvboxPurpleUnderline" },
    SpellBad = { link = "GruvboxRedUnderline" },
    SpellLocal = { link = "GruvboxAquaUnderline" },
    SpellCap = vim.g.gruvbox_improved_warnings and {
      fg = colors.green,
      bold = config.bold,
      italic = config.italic,
    } or { link = "GruvboxBlueUnderline" },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = vim.g.gruvbox_invert_tabline },
    TabLine = { link = "TabLineFill" },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = vim.g.gruvbox_invert_tabline },
    Title = { link = "GruvboxGreenBold" },
    Visual = { bg = colors.bg3, reverse = vim.g.gruvbox_invert_selection },
    VisualNOS = { link = "Visual" },
    WarningMsg = { link = "GruvboxRedBold" },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Constant = { link = "GruvboxPurple" },
    Special = { fg = colors.orange, bg = colors.bg1, italic = config.italic },
    String = { fg = colors.fg1, bg = colors.bg1, italic = config.italic },
    Character = { link = "GruvboxPurple" },
    Number = { link = "GruvboxPurple" },
    Boolean = { link = "GruvboxPurple" },
    Float = { link = "GruvboxPurple" },
    Identifier = { link = "GruvboxBlue" },
    Function = { link = "GruvboxGreenBold" },
    Statement = { link = "GruvboxRed" },
    Conditional = { link = "GruvboxRed" },
    Repeat = { link = "GruvboxRed" },
    Label = { link = "GruvboxRed" },
    Exception = { link = "GruvboxRed" },
    Keyword = { link = "GruvboxRed" },
    Operator = { link = "GruvboxFg1" },
    PreProc = { link = "GruvboxAqua" },
    Include = { link = "GruvboxAqua" },
    Define = { link = "GruvboxAqua" },
    Macro = { link = "GruvboxAqua" },
    PreCondit = { link = "GruvboxAqua" },
    Type = { link = "GruvboxYellow" },
    StorageClass = { link = "GruvboxOrange" },
    Structure = { link = "GruvboxAqua" },
    Typedef = { link = "GruvboxYellow" },
    SpecialChar = { link = "GruvboxRed" },
    Tag = { link = "GruvboxAquaBold" },
    Delimiter = { link = "GruvboxFg3" },
    Comment = { fg = colors.gray, italic = config.italic },
    Debug = { link = "GruvboxRed" },
    Underlined = { fg = colors.blue, underline = config.underline },
    Bold = { bold = config.bold },
    Italic = { italic = config.italic },
    Ignore = {},
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Todo = { fg = colors.fg0, bold = config.bold, italic = config.italic },
    diffAdded = { link = "GruvboxGreen" },
    diffRemoved = { link = "GruvboxRed" },
    diffChanged = { link = "GruvboxAqua" },
    diffFile = { link = "GruvboxOrange" },
    diffNewFile = { link = "GruvboxYellow" },
    diffLine = { link = "GruvboxBlue" },
    -- signature
    SignatureMarkText = { link = "GruvboxBlueSign" },
    SignatureMarkerText = { link = "GruvboxPurpleSign" },
    -- gitcommit
    gitcommitSelectedFile = { link = "GruvboxGreen" },
    gitcommitDiscardedFile = { link = "GruvboxRed" },
    -- checkhealth
    healthError = { fg = colors.bg0, bg = colors.red },
    healthSuccess = { fg = colors.bg0, bg = colors.green },
    healthWarning = { fg = colors.bg0, bg = colors.yellow },
  }

  -- TODO: overrides
  for group, hl in pairs(config.overrides) do
    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
