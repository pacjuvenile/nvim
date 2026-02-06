local M = {}

M.ts_config = {
  parser = { 'python' }
}

M.ls_config = {
  name = 'pyright',
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    '.git',
    'pyproject.toml',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      }
    }
  }
}

-- local python_augroup = vim.api.nvim_create_augroup('Python', { clear = true })
-- vim.api.nvim_create_autocmd('FileType', {
--   group = python_augroup,
--   pattern = 'python',
-- w  callback = function()
--     vim.bo.indentexpr = ''
--   end
-- })

return M
