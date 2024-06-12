-- ~/.config/nvim/lua/dortes/core/custom_functions.lua

local M = {}

-- Define the smart_dd function
function M.smart_dd()
  local line = vim.api.nvim_get_current_line()
  if line:match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end

-- Create a wrapper function to call smart_dd and execute the returned command
function M.smart_dd_wrapper()
  local cmd = M.smart_dd()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, false, true), "n", true)
end

return M
