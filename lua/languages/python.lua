local M = {}

M.ts_config = {
  parser = { "python" }
}

M.ls_config = {
  name = "pyright",
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    ".git",
    "pyproject.toml",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        extraBuiltins = { "config" }
      }
    }
  }
}

return M
