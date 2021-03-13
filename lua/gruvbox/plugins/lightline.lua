-- lightline support
local M = {}

local function get_gruvbox_color(group)
  local gui_color = vim.fn.synIDattr(vim.fn.hlID(group), "fg", "gui")
  local term_color = vim.fn.synIDattr(vim.fn.hlID(group), "fg", "cterm")
  return {gui_color, term_color}
end

local bg0 = get_gruvbox_color("GruvboxBg0")
local bg1 = get_gruvbox_color("GruvboxBg1")
local bg2 = get_gruvbox_color("GruvboxBg2")
local bg4 = get_gruvbox_color("GruvboxBg4")
local fg1 = get_gruvbox_color("GruvboxFg1")
local fg4 = get_gruvbox_color("GruvboxFg4")

local yellow = get_gruvbox_color("GruvboxYellow")
local blue = get_gruvbox_color("GruvboxBlue")
local aqua = get_gruvbox_color("GruvboxAqua")
local orange = get_gruvbox_color("GruvboxOrange")
local red = get_gruvbox_color("GruvboxRed")
local green = get_gruvbox_color("GruvboxGreen")

local p = {
  normal = {
    right = {{bg0, fg4}, {fg4, bg2}},
    left = {{bg0, fg4, "bold"}, {fg4, bg2}},
    middle = {{fg4, bg1}},
    error = {{bg0, red}},
    warning = {{bg0, yellow}},
  },
  inactive = {
    right = {{bg4, bg1}, {bg4, bg1}},
    left = {{bg4, bg1}, {bg4, bg1}},
    middle = {{bg4, bg1}},
  },
  insert = {
    right = {{bg0, blue}, {fg1, bg2}},
    left = {{bg0, blue, "bold"}, {fg1, bg2}},
    middle = {{fg4, bg1}},
  },
  terminal = {
    right = {{bg0, green}, {fg1, bg2}},
    left = {{bg0, green, "bold"}, {fg1, bg2}},
    middle = {{fg4, bg1}},
  },
  replace = {
    right = {{bg0, aqua}, {fg1, bg2}},
    left = {{bg0, aqua, "bold"}, {fg1, bg2}},
    middle = {{fg4, bg1}},
  },
  visual = {
    right = {{bg0, orange}, {bg0, bg4}},
    left = {{bg0, orange, "bold"}, {bg0, bg4}},
    middle = {{fg4, bg1}},
  },
  tabline = {
    right = {{bg0, orange}},
    left = {{fg4, bg2}},
    middle = {{bg0, bg4}},
    tabsel = {{bg0, fg4}},
  },
}

M.start = function()
  if not vim.fn.exists(vim.g.lightline) then
    return
  end

  if vim.g.loaded_lightline then
    vim.g["lightline#colorscheme#gruvbox#palette"] =
      vim.api.nvim_call_function("lightline#colorscheme#flatten", {p})
  end
end

return M
