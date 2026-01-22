-- 文件编码
vim.opt.encoding       = "utf-8" -- 启用utf-8

-- 高亮颜色
vim.opt.termguicolors  = true -- 启用24-bit颜色

-- 行号
vim.opt.number         = true -- 显示当前行号
vim.opt.relativenumber = true -- 显示相对行号

-- Tab行为
vim.opt.shiftwidth     = 2    -- 缩进宽度2个空格
vim.opt.tabstop        = 8    -- 制表符宽度8个空格
vim.opt.softtabstop    = 2    -- Tab/Backspace对应2个空格宽度
vim.opt.expandtab      = true -- Tab转换为空格

-- 新行缩进
vim.opt.smartindent    = true -- 启动语义缩进

-- 光标
vim.opt.cursorline     = true -- 高亮光标所在行

-- 命令行
vim.opt.cmdheight      = 1 --
vim.opt.laststatus     = 3 -- 所有window共用底部状态栏
vim.opt.cmdwinheight   = 1 -- 设置命令窗口大小为1

-- 搜索设置
vim.opt.ignorecase     = true -- 不输入大写则大小写不敏感
vim.opt.smartcase      = true -- 输入大写则大写敏感

-- 折叠设置
vim.opt.foldmethod     = "expr" -- 折叠方法基于表达式
vim.opt.foldlevel      = 99     -- 大于折叠层级的行会被折叠

-- 窗口分割
vim.opt.splitright     = true -- 新窗口分割到右侧
vim.opt.splitbelow     = true -- 新窗口分割到下方

-- 文件缓存
vim.opt.swapfile       = false -- 关闭交换文件

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true
})
