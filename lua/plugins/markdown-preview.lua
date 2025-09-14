return {
    "iamcco/markdown-preview.nvim",
    lazy = true,
    cmd = { 
        "MarkdownPreviewToggle",
        "MarkdownPreview", 
        "MarkdownPreviewStop" },
    ft = {
        "markdown"
    },
    build = "cd app && yarn install",
  --   init = function()
  --   -- WSL2 专用浏览器设置
  --   vim.g.mkdp_browserfunc = 'MkdpWslOpen'
  --
  --   -- 定义跨系统打开函数
  --   vim.cmd([[
  --   function! MkdpWslOpen(url) abort
  --     " 替换地址解决WSL2网络隔离问题
  --     let url = substitute(a:url, '0.0.0.0', 'localhost', 'g')
  --
  --     " 通过cmd.exe调用Windows默认浏览器
  --     silent call system('cmd.exe /c start ' . shellescape(url))
  --
  --     " 防止界面卡顿
  --     redraw!
  --   endfunction
  --   ]])
  --
  --   -- 可选：禁用自动启动（按需开启）
  --   vim.g.mkdp_auto_start = 0
  -- end
}
