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
  filetypes = { "markdown" },
  root_markers = {
    ".git"
  },
  settings = {}
}

vim.lsp.config("marksman", M.ls_config)
vim.lsp.enable("marksman")

return M
