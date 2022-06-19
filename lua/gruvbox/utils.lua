-- util functions
local M = {}
local hl = vim.api.nvim_set_hl

-- check if vim.g.gruvbox_* color exists in current palette, return default color
-- otherwise
M.get_color_from_var = function(color, default, colors)
  if color == nil then
    return default
  end

  local c = colors[color]
  if c == nil then
    print(string.format("%s color could not be found, using default", color))
    return default
  end
  return c
end

M.merge = function(tbls)
  local source = {}
  for _, group in pairs(tbls) do
    for groupName, opts in pairs(group) do
      source[groupName] = opts
    end
  end

  return source
end

M.add_highlights = function(hls)
  for group, settings in pairs(hls) do
    -- https://github.com/akinsho/bufferline.nvim/issues/386#issuecomment-1103849289
    if group == "Normal" then
      vim.cmd(string.format("hi! Normal guifg=%s guibg=%s", settings.fg, settings.bg))
    else
      hl(0, group, settings)
    end
  end
end

return M
