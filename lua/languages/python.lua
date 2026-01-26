local M = {}

M.ts_config = {
  parser = { "python" }
}

M.ls_config = {
  name = "pyright",
  cmd = { "pyright-langserver" },
  filetypes = { "python" },
  root_markers = {
    ".git"
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly"
      }
    }
  }
}

return M
