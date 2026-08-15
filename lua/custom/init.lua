-- 字符编码
vim.cmd('language en_US.UTF-8')
vim.g.encoding = 'UTF-8'

-- 剪切板
vim.g.clipboard = 'osc52'

-- 全局映射
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- 关闭内置文件类型插件&缩进
vim.cmd('filetype indent off')

-- 插件管理
require('custom.core.plugin-manager')
-- 语言设置
require('custom.core.lsp')
-- 自动命令
require('custom.core.autocmds')
-- 选项设置
require('custom.core.options')
-- 键位配置
require('custom.core.keymaps')
