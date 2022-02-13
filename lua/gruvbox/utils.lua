-- util functions
local M = {}
local hl = vim.api.nvim_set_hl
local link = vim.highlight.link

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
    for k, v in pairs(hls) do
      if type(v) == "table" then
        hl(0, k, v)
      else
        link(k, v, true)
      end
    end
  -- for k, v in pairs(hls) do
  --   if type(v) == "table" then
  --     vim.cmd(
  --       string.format(
  --         "hi %s guifg=%s guibg=%s guisp=%s gui=%s",
  --         k,
  --         opt.fg or "NONE",
  --         opt.bg or "NONE",
  --         opt.sp or "NONE",
  --         opt.gui or "NONE"
  --       )
  --     )
  --   else
  --     vim.cmd(string.format("hi! link %s %s", k, v))
  --   end
  -- end
end

return M
