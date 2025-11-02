vim.opt.number          = true      -- 显示当前行号
vim.opt.relativenumber  = true      -- 显示相对行号

vim.opt.tabstop         = 8         -- 制表符宽度8个空格
vim.opt.shiftwidth      = 4         -- 缩进宽度4个空格
vim.opt.expandtab       = true      -- Tab转换为空格
vim.opt.softtabstop     = 4         -- Tab/Backspace对应4个空格宽度

vim.opt.cursorline      = true      -- 高亮光标所在行

vim.opt.splitright      = true      -- 新窗口分割到右侧
vim.opt.splitbelow      = true      -- 新窗口分割到下方

vim.opt.cmdwinheight    = 1         -- 设置命令窗口大小为1

vim.opt.ignorecase      = true      -- 不输入大写则大小写不敏感
vim.opt.smartcase       = true      -- 输入大写则大写敏感

vim.opt.foldmethod      = "expr"    -- 折叠方法基于表达式
vim.opt.foldlevel       = 99        -- 大于折叠层级的行会被折叠

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true
})
