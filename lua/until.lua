local M = {}


-- shell
function M.shell()
  if vim.fn.has("win32") == 1 then
    return "pwsh.exe"
  elseif vim.fn.has("unix") == 1 then
    return vim.o.shell
  end
end


return M

