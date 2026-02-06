local M = {}

M.ts_config = {
  parser = {
    'markdown',
    'markdown_inline'
  }
}

M.ls_config = {
  name = 'marksman',
  cmd = { 'marksman' },
  filetypes = { 'markdown' },
  root_markers = {
    '.git'
  },
  settings = {}
}

return M
