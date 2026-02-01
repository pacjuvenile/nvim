local M = {}

M.url = "https://github.com/iamcco/markdown-preview.nvim"
M.build = "cd app && yarn install"

M.lazy = true
M.ft = "markdown"

M.init = function()
  vim.g.mkdp_auto_start = 0
  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_browserfunc = "OpenQuteWin"
  vim.cmd [[
    function! OpenQuteWin(url)
      " 核心逻辑：wsl.exe调用Windows端qutebrowser，传入预览URL
      " 后台执行(&)：避免阻塞Neovim，浏览器启动后不卡终端
      execute '!wsl.exe /mnt/c/Users/sunny/app/qutebrowser/qutebrowser.exe ' . a:url . ' &'
      " 静默执行：消除Neovim的"按回车继续"提示
      redraw!
    endfunction
  ]]
  vim.g.mkdp_filetypes = { "markdown" }
end

return M
