local M = {}

M.ts_config = {
  parser = { 'bash' }
}

local shell_augroup = vim.api.nvim_create_augroup('Shell', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = shell_augroup,
  pattern = { '*.do', '.bat' },
  callback = function()
    vim.bo.filetype = 'sh'
    -- vim.wo[0][0].foldmethod = 'manual'
  end
})

return M
