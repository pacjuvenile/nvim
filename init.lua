-- 全局设置
vim.g.loaded_netrw = 1          -- disable netrw
vim.g.loaded_netrwPlugin = 1    -- disable netrw plugin
vim.opt.encoding = "utf-8"      -- enable utf-8
vim.opt.termguicolors = true    -- enable 24-bit color
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 选项设置
require("settings.options")
-- 键位配置
require("settings.keymaps")
-- 自动命令
require("settings.autocmds")

-- 插件管理
require("extensions.plugin_manager.lazy")
