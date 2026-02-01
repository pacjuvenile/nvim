local M = {}

M.url = "https://github.com/iamcco/markdown-preview.nvim"
M.build = "cd app && yarn install"

M.lazy = true
M.ft = "markdown"

M.init = function()
  vim.g.mkdp_filetypes = { "markdown" }
  vim.g.mkdp_browser = "/mnt/c/Users/sunny/app/qutebrowser/qutebrowser"
end

return M
