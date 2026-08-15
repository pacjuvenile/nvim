-- global options
vim.o.cmdheight      = 0     -- 不显示底部命令行区域
vim.o.cmdwinheight   = 1     -- 设置命令窗口大小为1
vim.o.laststatus     = 3     -- 所有window共用底部状态栏
vim.o.showmode       = false -- 不显示模式
vim.o.ignorecase     = true  -- 不输入大写则大小写不敏感
vim.o.smartcase      = true  -- 输入大写则大写敏感
vim.o.splitright     = true  -- 新窗口分割到右侧
vim.o.splitbelow     = true  -- 新窗口分割到下方
vim.o.timeoutlen     = 800   -- 缩短按键超时时间
vim.o.pumheight      = 10    -- 最多显示10个补全项
vim.o.writebackup    = false -- 禁用写入备份文件
vim.o.backup         = false -- 禁用备份文件

-- buffer options
vim.o.fileencoding   = 'utf-8' -- 使用utf-8读写
vim.o.swapfile       = false   -- 禁用交换文件
vim.o.autoread       = true    -- 自动读取外部修改
vim.o.autoindent     = true    -- 继承上一行的缩进
vim.o.shiftwidth     = 2       -- 缩进宽度2个空格
vim.o.tabstop        = 2       -- 制表符宽度2个空格
-- vim.o.softtabstop    = 2    -- Tab/Backspace对应2个空格宽度
-- vim.o.expandtab      = true -- Tab转换为空格
vim.o.nrformats      = 'bin,hex,alpha' -- 二进制，十六进制和字母都视为数字(<C-a>加1,<C-x>减1)

-- window options
vim.o.number         = true -- 显示当前行号
vim.o.relativenumber = true -- 显示相对行号
vim.o.cursorline     = true -- 高亮光标所在行
-- vim.o.signcolumn     = 'no' -- 不显示左侧符号列
vim.o.foldlevel      = 99   -- 大于折叠层级的行会被折叠
