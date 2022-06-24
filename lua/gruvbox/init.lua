local M = {}

local function add_highlights(hls)
  for group, settings in pairs(hls) do
    -- we need https://github.com/neovim/neovim/commit/9aba2043351c79cd9bc8fa7b229ee7629ba178f0 in stable version first
    -- in order to get Normal using nvim_set_hl
    if group == "Normal" then
      vim.cmd(string.format("hi! Normal guifg=%s guibg=%s", settings.fg, settings.bg))
    else
      vim.api.nvim_set_hl(0, group, settings)
    end
  end
end

-- default configs
M.config = {
  undercurl = true,
  underline = true,
  bold = true,
  italic = true, -- will make italic comments and special strings
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  contrast = "hard",
  overrides = {},
}

function M.setup(config)
  M.config = vim.tbl_extend("force", M.config, config or {})
end

M.load = function()
  if vim.version().minor < 7 then
    vim.notify_once("gruvbox.nvim: you must use neovim 0.7 or higher")
    return
  end

  -- reset colors
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true

  local hlgroups = require("gruvbox.hlgroups").setup()

  add_highlights(hlgroups)

  vim.cmd("colorscheme gruvbox")
end

return M
