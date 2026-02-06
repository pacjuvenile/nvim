local M = {}

M.ts_config = {
  parser = { 'rust' }
}

M.ls_config = {
  name = 'rust_analyzer',
  cmd = { 'rust-analyzer' } ,
  filetypes = { 'rust' },
  root_markers = {
    '.git',
    'Cargo.toml',
  },
  capabilities = {
      experimental = {
        serverStatusNotification = true,
        commands = {
          commands = {
            'rust-analyzer.showReferences',
            'rust-analyzer.runSingle',
            'rust-analyzer.debugSingle',
          },
        },
      },
  },
  settings = {
    ['rust-analyzer'] = {
      lens = {
        debug = { enable = true },
        enable = true,
        implementations = { enable = true },
        references = {
          adt = { enable = true },
          enumVariant = { enable = true },
          method = { enable = true },
          trait = { enable = true },
        },
        run = { enable = true },
        updateTest = { enable = true },
      },
    },
  },
}

return M
