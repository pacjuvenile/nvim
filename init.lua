-- 全局设置
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 插件管理
require("plugin_manager")
-- 语言设置
require("settings.lsp")
-- 选项设置
require("settings.options")
-- 键位配置
require("settings.keymaps")
-- 自动命令
require("settings.autocmds")
