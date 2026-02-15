local M = {}

M.ts_config = {
  parser = { 'ruby' }
}

M.ls_config = {
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start()
  end
}

return M
