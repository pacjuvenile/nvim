-- 全局设置
vim.g.mapleader = " "

-- 插件管理
require("plugin_manager.lazy")

-- 选项设置
require("settings.options")
-- 键位配置
require("settings.keymaps")
-- 自动命令
require("settings.autocmds")
