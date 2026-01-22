-- 全局设置
vim.g.loaded_netrw = 1          -- 禁用netrw
vim.g.loaded_netrwPlugin = 1    -- 禁用netrw插件
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 插件管理
require("settings.plugin_manager")
-- 语言设置
require("settings.langs")
-- 选项设置
require("settings.options")
-- 键位配置
require("settings.keymaps")
-- 自动命令
require("settings.autocmds")
