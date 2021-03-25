-- util functions
local M = {}

M.tobool = function(val)
  if val == 0 or not val then
    return false
  end
  return true
end

return M
