local M = {}

M.ts_config = {
  parser = { 'systemverilog' }
}

-- M.ls_config = {
--   name = 'svls',
--   cmd = { 'svls' },
--   filetypes = { 'systemverilog' },
--   root_markers = { '.git' },
--   settings = {
--     svls = {
--       option = {
--           linter = false
--       }
--     }
--   }
-- }

-- 为verilog仿真专用的do脚本设置
local do_augroup = vim.api.nvim_create_augroup('Do', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = do_augroup,
  pattern = { '*.do' },
  callback = function()
    vim.bo.filetype = 'sh'
    vim.wo[0][0].foldmethod = 'manual'
  end
})

return M
