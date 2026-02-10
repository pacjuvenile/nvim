local M = {}

M.ts_config = {
  parser = { 'systemverilog' }
}

M.ls_config = {
  name = 'svls',
  cmd = { 'svls' },
  filetypes = { 'systemverilog', 'verilog' },
  root_markers = { '.git' },
  settings = {
    svls = {
      option = {
          linter = false
      }
    }
  }
}

return M
