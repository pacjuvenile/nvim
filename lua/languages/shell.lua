local M = {}

M.ts_config = {
  parser = { 'zsh', 'powershell' }
}

local do_augroup = vim.api.nvim_create_augroup('Do', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = do_augroup,
  pattern = { '*.do' },
  callback = function()
    vim.bo.filetype = 'zsh'
    vim.wo[0][0].foldmethod = 'manual'
  end
})

return M
