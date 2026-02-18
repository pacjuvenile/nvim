-- 文件编码
vim.opt.fileencoding   = 'utf-8' -- 启用utf-8

-- 同步外部修改
vim.opt.autoread       = true -- 自动读取外部修改

-- 高亮颜色
vim.opt.termguicolors  = true -- 启用24-bit颜色

-- 行号
vim.opt.number         = true -- 显示当前行号
vim.opt.relativenumber = true -- 显示相对行号

-- 缩进
vim.opt.autoindent     = true  -- 继承上一行的缩进

-- Tab行为
vim.opt.shiftwidth     = 2    -- 缩进宽度2个空格
vim.opt.tabstop        = 2    -- 制表符宽度8个空格
-- vim.opt.softtabstop    = 2    -- Tab/Backspace对应2个空格宽度
-- vim.opt.expandtab      = true -- Tab转换为空格

-- 光标
vim.opt.cursorline     = true -- 高亮光标所在行

-- 符号列
-- vim.opt.signcolumn     = 'no' -- 不显示左侧符号列

-- 命令行
vim.opt.cmdheight      = 1 -- 始终显示一行的底部命令行区域
vim.opt.cmdwinheight   = 1 -- 设置命令窗口大小为1

-- 状态栏
vim.opt.laststatus     = 3 -- 所有window共用底部状态栏

-- 搜索设置
vim.opt.ignorecase     = true -- 不输入大写则大小写不敏感
vim.opt.smartcase      = true -- 输入大写则大写敏感

-- 数字格式设置（<C-a>加1,<C-x>减1）
vim.opt.nrformats      = 'bin,hex,alpha' -- 二进制，十六进制和字母都视为数字

-- 折叠设置
vim.opt.foldlevel      = 99 -- 大于折叠层级的行会被折叠

-- 窗口分割
vim.opt.splitright     = true -- 新窗口分割到右侧
vim.opt.splitbelow     = true -- 新窗口分割到下方

-- 按键超时时间
vim.opt.timeoutlen     = 500 -- 缩短按键超时时间

-- 补全项显示的最大数目
vim.opt.pumheight      = 10 -- 最多显示10个补全项

-- 文件缓存
vim.opt.swapfile       = false --禁用交换文件
vim.opt.writebackup    = false -- 禁用写入备份文件
vim.opt.backup         = false -- 禁用备份文件
