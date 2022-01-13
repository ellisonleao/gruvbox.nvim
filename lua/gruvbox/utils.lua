-- util functions
local M = {}

M.tobool = function(val)
  if val == 0 or not val then
    return false
  end
  return true
end

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

M.highlights = function(hls)
  for k, v in pairs(hls) do
    if type(v) == "table" then
      -- no blank strings allowed for guifg, guibg, guisp and gui
      local opt = {}
      for kk, vv in pairs(v) do
        if vv == "" then
          vv = nil
        end

        opt[kk] = vv
      end

      vim.cmd(
        string.format(
          "hi %s guifg=%s guibg=%s guisp=%s gui=%s",
          k,
          opt.fg or "NONE",
          opt.bg or "NONE",
          opt.sp or "NONE",
          opt.gui or "NONE"
        )
      )
    else
      vim.cmd(string.format("hi! link %s %s", k, v))
    end
  end
end

M.export_to_buffer = function(hls)
  local commands = {}
  for k, v in pairs(hls) do
    local command = ""
    if type(v) == "table" then
      -- no blank strings allowed for guifg, guibg, guisp and gui
      local opt = {}
      for kk, vv in pairs(v) do
        if vv == "" then
          vv = nil
        end

        opt[kk] = vv
      end

        command = string.format(
          "hi %s guifg=%s guibg=%s guisp=%s gui=%s",
          k,
          opt.fg or "NONE",
          opt.bg or "NONE",
          opt.sp or "NONE",
          opt.gui or "NONE"
        )
    else
      command = string.format("hi! link %s %s", k, v)
    end

    if command ~= "" then
      table.insert(commands, command)
    end
  end

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = vim.api.nvim_win_get_width(0) - 2 ,
    height = vim.api.nvim_win_get_height(0) - 2,
    row = 1,
    col = 1,
    style = "minimal",
  })

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, commands)
end

return M
