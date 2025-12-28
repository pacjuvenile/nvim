local M = {}

M.ts_config = {
  parser_installed = true,
  parser = {
    "markdown",
    "markdown_inline"
  }
}

M.ls_config = {
  cmd = { "marksman" },
  filetye = { "md" },
  root_markers = {
    ".git"
  },

  settings = {}
}

return M
