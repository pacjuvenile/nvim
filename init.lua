-- 全局设置
vim.g.mapleader = " "

-- 插件管理
require("config.lazy")

-- 选项设置
require("core.options")
-- 键位配置
require("core.keymaps")
-- 自动命令
require("core.autocmds")
