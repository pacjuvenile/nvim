local M = {}

M.url = "https://github.com/iamcco/markdown-preview.nvim"
M.build = "cd app && yarn install"

M.lazy = true
M.ft = "markdown"

M.init = function()
  vim.g.mkdp_auto_start = 0
  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
  vim.cmd([[
    function! OpenMarkdownPreview(url)
      execute '!wsl.exe /mnt/c/Users/sunny/app/qutebrowser/qutebrowser.exe ' . a:url . ' &'
      redraw!
    endfunction
  ]])
  vim.g.mkdp_filetypes = { "markdown" }
  vim.g.mkdp_combine_preview = 1
  vim.g.mkdp_combine_preview_auto_refresh = 1
end

return M
