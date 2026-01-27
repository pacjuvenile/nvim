local M = {}

M.ts_config = {
  parser = { "rust" }
}

M.ls_config = {
  name = nil,
  cmd = { "" } ,
  filetypes = { "rust" },
  root_markers = {
    ".git"
  },
  settings = {
  }
}

return M
