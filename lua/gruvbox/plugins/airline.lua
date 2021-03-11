local M = {}

M.refresh = function()
  vim.api.nvim_err_writeln("refresh called!")
  local M0 = vim.fn["airline#themes#get_highlight"]("Identifier")

  local accents_group = vim.fn["airline#themes#get_highlight"]("Special")
  local modified_group = {M0[1], "", M0[2], "", ""}
  local warning_group = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                                {"Question", "fg"})
  local error_group = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                              {"WarningMsg", "fg"})

  local N1 = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                     {"StatusLineNC", "fg"})
  local N2 = vim.fn["airline#themes#get_highlight2"]({"StatusLineNC", "bg"},
                                                     {"PMenu", "bg"})
  local N3 = vim.fn["airline#themes#get_highlight2"]({"StatusLineNC", "bg"},
                                                     {"StatusLineNC", "fg"})

  -- normal mode vars
  vim.g["airline#themes#gruvbox#palette.normal"] =
    vim.fn["airline#themes#generate_color_map"](N1, N2, N3)
  vim.g["airline#themes#gruvbox#palette.normal_modified"] = {airline_c = modified_group}
  vim.g["airline#themes#gruvbox#palette.normal.airline_warning"] = warning_group
  vim.g["airline#themes#gruvbox#palette.normal_modified.airline_warning"] =
    warning_group
  vim.g["airline#themes#gruvbox#palette.normal_modified.airline_warning"] =
    warning_group
  vim.g["airline#themes#gruvbox#palette.normal.airline_error"] = error_group
  vim.g["airline#themes#gruvbox#palette.normal_modified.airline_error"] = error_group
  vim.g["airline#themes#gruvbox#palette.normal.airline_term"] = N3
  vim.g["airline#themes#gruvbox#palette.normal_modified.airline_term"] = N3

  -- insert mode vars
  local I1 = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                     {"Identifier", "fg"})
  local I2 = N2
  local I3 = vim.fn["airline#themes#get_highlight2"]({"GruvboxFg1", "fg"},
                                                     {"Pmenu", "bg"})

  vim.g["airline#themes#gruvbox#palette.insert"] =
    vim.fn["airline#themes#generate_color_map"](I1, I2, I3)

  vim.g["airline#themes#gruvbox#palette.insert_modified"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified"]

  vim.g["airline#themes#gruvbox#palette.insert.airline_warning"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_warning"]

  vim.g["airline#themes#gruvbox#palette.insert_modified.airline_warning"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_warning"]

  vim.g["airline#themes#gruvbox#palette.insert.airline_error"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_error"]

  vim.g["airline#themes#gruvbox#palette.insert_modified.airline_error"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_error"]

  vim.g["airline#themes#gruvbox#palette.insert.airline_term"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_term"]

  vim.g["airline#themes#gruvbox#palette.insert_modified.airline_term"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_term"]

  -- replace mode vars
  local R1 = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                     {"Structure", "fg"})
  local R2 = I2
  local R3 = I3

  vim.g["airline#themes#gruvbox#palette.replace"] =
    vim.fn["airline#themes#generate_color_map"](R1, R2, R3)

  vim.g["airline#themes#gruvbox#palette.replace_modified"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified"]

  vim.g["airline#themes#gruvbox#palette.replace.airline_warning"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_warning"]

  vim.g["airline#themes#gruvbox#palette.replace_modified.airline_warning"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_warning"]

  vim.g["airline#themes#gruvbox#palette.replace.airline_error"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_error"]

  vim.g["airline#themes#gruvbox#palette.replace_modified.airline_error"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_error"]

  vim.g["airline#themes#gruvbox#palette.replace.airline_term"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_term"]

  vim.g["airline#themes#gruvbox#palette.replace_modified.airline_term"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_term"]

  -- visual mode vars
  local V1 = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                     {"Question", "fg"})
  local V2 = N2
  local V3 = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                     {"TabLine", "fg"})

  vim.g["airline#themes#gruvbox#palette.replace"] =
    vim.fn["airline#themes#generate_color_map"](V1, V2, V3)

  vim.g["airline#themes#gruvbox#palette.visual_modified"] =
    {airline_c = {V3[1], "", V3[3], "", ""}}

  vim.g["airline#themes#gruvbox#palette.visual.airline_warning"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_warning"]

  vim.g["airline#themes#gruvbox#palette.visual_modified.airline_warning"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_warning"]

  vim.g["airline#themes#gruvbox#palette.visual.airline_error"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_error"]

  vim.g["airline#themes#gruvbox#palette.visual_modified.airline_error"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_error"]

  vim.g["airline#themes#gruvbox#palette.visual.airline_term"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_term"]

  vim.g["airline#themes#gruvbox#palette.visual_modified.airline_term"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_term"]

  local C1 = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                     {"GruvboxGreen", "fg"})
  local C2 = I2
  local C3 = I3

  vim.g["airline#themes#gruvbox#palette.commandline"] =
    vim.fn["airline#themes#generate_color_map"](C1, C2, C3)

  vim.g["airline#themes#gruvbox#palette.commandline_modified"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified"]

  vim.g["airline#themes#gruvbox#palette.commandline.airline_warning"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_warning"]

  vim.g["airline#themes#gruvbox#palette.commandline_modified.airline_warning"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_warning"]

  vim.g["airline#themes#gruvbox#palette.commandline.airline_error"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_error"]

  vim.g["airline#themes#gruvbox#palette.commandline_modified.airline_error"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_error"]

  vim.g["airline#themes#gruvbox#palette.commandline.airline_term"] =
    vim.g["airline#themes#gruvbox#palette.normal.airline_term"]

  vim.g["airline#themes#gruvbox#palette.commandline_modified.airline_term"] =
    vim.g["airline#themes#gruvbox#palette.normal_modified.airline_term"]

  local IA = vim.fn["airline#themes#get_highlight2"]({"TabLine", "fg"},
                                                     {"CursorLine", "bg"})
  vim.g["airline#themes#gruvbox#palette.inactive"] =
    vim.fn["airline#themes#generate_color_map"](IA, IA, IA)

  vim.g["airline#themes#gruvbox#palette.inactive_modified"] =
    {airline_c = modified_group}
  vim.g["airline#themes#gruvbox#palette.accents"] = {red = accents_group}

  local TF = vim.fn["airline#themes#get_highlight2"]({"GruvboxBg0", "fg"},
                                                     {"GruvboxBg0", "fg"})

  vim.g["airline#themes#gruvbox#palette.tabline"] =
    {
      airline_tab = N2,
      airline_tabsel = N1,
      airline_tabtype = V1,
      airline_tablabel = V1,
      airline_tablabel_right = V1,
      airline_tabfill = TF,
      airline_tabhid = IA,
      airline_tabmod = I1,
    }
end

return M
