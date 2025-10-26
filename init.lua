-- 全局设置
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- 颜色主题
vim.cmd("colorscheme habamax")
vim.wo.cursorline = true

-- 选项设置
require("settings.options")
-- 键位配置
require("settings.keymaps")
-- 自动命令
require("settings.autocmds")

-- 插件管理
require("plugin_manager.lazy")
