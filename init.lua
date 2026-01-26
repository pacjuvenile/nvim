-- 字符编码
vim.cmd("language en_US.UTF-8")
vim.g.encoding = "UTF-8"

-- 全局映射
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 选项设置
require("core.options")
-- 插件管理
require("plugin-manager")
-- 语言设置
require("core.lsp")
-- 键位配置
require("core.keymaps")
-- 自动命令
require("core.autocmds")
